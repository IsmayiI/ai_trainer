import 'package:ai_trainer/core/models/training_plan.model.dart';
import 'package:ai_trainer/core/services/ai_generator.service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ai_trainer.controller.g.dart';

@riverpod
class AiTrainerController extends _$AiTrainerController {
  AiGeneratorService get _aiService => ref.read(aiGeneratorServiceProvider);
  @override
  Future<TrainingPlan?> build() async {
    return null;
  }

  Future<void> generate() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _aiService.generateMockData());
  }
}
