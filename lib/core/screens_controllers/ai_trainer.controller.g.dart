// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_trainer.controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AiTrainerController)
final aiTrainerControllerProvider = AiTrainerControllerProvider._();

final class AiTrainerControllerProvider
    extends $AsyncNotifierProvider<AiTrainerController, TrainingPlan?> {
  AiTrainerControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'aiTrainerControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$aiTrainerControllerHash();

  @$internal
  @override
  AiTrainerController create() => AiTrainerController();
}

String _$aiTrainerControllerHash() =>
    r'9ff9515aac821eab8985e20e9d61b3dce6e059f9';

abstract class _$AiTrainerController extends $AsyncNotifier<TrainingPlan?> {
  FutureOr<TrainingPlan?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<TrainingPlan?>, TrainingPlan?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<TrainingPlan?>, TrainingPlan?>,
              AsyncValue<TrainingPlan?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
