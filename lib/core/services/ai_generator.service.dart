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

  Future<TrainingPlan> generateWithGemini(String prompt) async {
    final model = GenerativeModel(
      model: 'gemini-2.0-flash',
      apiKey: Env.geminiApiKey,
    );

    final result = await model.generateContent([Content.text(prompt)]);
    final content = result.text;

    if (content == null || content.isEmpty) {
      throw Exception('No content generated');
    }

    return TrainingPlan.fromJson(jsonDecode(content));
  }
}
