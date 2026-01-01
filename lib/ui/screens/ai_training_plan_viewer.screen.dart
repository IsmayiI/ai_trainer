import 'package:ai_trainer/core/screens_controllers/ai_trainer.controller.dart';
import 'package:ai_trainer/ui/widgets/ai_training_plan_viewer/training_plan_block.dart';
import 'package:ai_trainer/ui/widgets/async_value_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AiTrainingPlanViewerScreen extends ConsumerWidget {
  const AiTrainingPlanViewerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final asyncState = ref.watch(aiTrainerControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AI Trainer',
          style: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: AsyncValueWidget(
        value: asyncState,
        data: (plan) {
          if (plan == null || plan.plans.isEmpty) {
            return const Center(child: Text('No workout plans found.'));
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: plan.plans.length,
                  itemBuilder: (context, index) {
                    return TrainingPlanBlock();
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
