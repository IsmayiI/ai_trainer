import 'package:ai_trainer/core/models/training_plan.model.dart';

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
          weight: [0, 0, 0],
        ),
        PlanItem(
          exercise: 'Squats',
          sets: 4,
          reps: [10, 12, 15, 20],
          weight: [0, 0, 0, 0],
        ),
      ],
    );
  }
}
