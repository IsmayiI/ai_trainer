import 'package:ai_trainer/core/models/training_plan.model.dart';
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
}
