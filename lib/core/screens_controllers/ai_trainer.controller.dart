import 'package:ai_trainer/core/models/training_plan.model.dart';
import 'package:ai_trainer/core/services/ai_generator.service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ai_trainer.controller.g.dart';

@Riverpod(keepAlive: true)
class AiTrainerController extends _$AiTrainerController {
  AiGeneratorService get _aiService => ref.read(aiGeneratorServiceProvider);
  @override
  Future<TrainingPlan?> build() async {
    return null;
  }

  Future<void> generate(String text) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _aiService.generateMockData());
  }

  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a workout.';
    }
    if (value.length <= 4) {
      return 'Minimum 5 characters required.';
    }
    return null;
  }
}
