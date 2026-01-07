import 'dart:convert';

import 'package:ai_trainer/core/config/env.dart';
import 'package:ai_trainer/core/models/training_plan.model.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ai_generator.service.g.dart';

@riverpod
AiGeneratorService aiGeneratorService(Ref ref) {
  return AiGeneratorService();
}

class AiGeneratorService {
  final model = GenerativeModel(
    model: 'gemini-2.0-flash',
    apiKey: Env.geminiApiKey,
    generationConfig: GenerationConfig(responseMimeType: 'application/json'),
  );

  Future<TrainingPlan> generateMockData() async {
    return TrainingPlan(
      title: 'Mock Training Plan',
      startDate: DateTime.now(),
      plans: [
        PlanItem(
          exercise: 'Push-ups',
          sets: 3,
          reps: [10, 12, 15],
          weights: [0, 0, 0],
        ),
        PlanItem(
          exercise: 'Squats',
          sets: 4,
          reps: [10, 12, 15, 20],
          weights: [0, 0, 0, 0],
        ),
      ],
    );
  }

  Future<TrainingPlan> generateWithGemini(String text) async {
    final prompt =
        """
            Convert this into a JSON training plan with training-title.

            Format:
            {
            "title": "training-title",
            "startDate": "YYYY-MM-DD",
            "plans": [
               {"exercise": "exercise-name", "sets": int, "reps": [int, int, ...], "weights": [int, int, ...]}
            ]
            }

            Example:
            {
            "title": "Full Body Workout",
            "startDate": "2023-10-01",
            "plans": [
               {"exercise": "Squats", "sets": 3, "reps": [15, 12, 10], "weights": [70, 75, 80]},
               {"exercise": "Overhead Press", "sets": 3, "reps": [12, 10, 8], "weights": [40, 45, 50]},
               {"exercise": "Deadlifts", "sets": 1, "reps": [12], "weights": [80]}
            ]
            }

            You are a personal trainer. Create a training plan based on the user's input with corresponding weights and reps in each set.
            The weight has to increase with each set, and the reps should decrease with each set. And startDate has to be today's date.

            User input: $text
         """;

    final result = await model.generateContent([Content.text(prompt)]);
    final content = result.text;

    if (content == null || content.isEmpty) {
      throw Exception('No content generated');
    }

    final jsonArr = jsonDecode(content) as List<dynamic>;
    return TrainingPlan.fromJson(jsonArr.first);
  }
}
