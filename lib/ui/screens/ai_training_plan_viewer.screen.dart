import 'package:ai_trainer/core/screens_controllers/ai_trainer.controller.dart';
import 'package:ai_trainer/ui/widgets/ai_training_plan_viewer/training_plan_block.dart';
import 'package:ai_trainer/ui/widgets/async_value_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AiTrainingPlanViewerScreen extends ConsumerWidget {
  final _pageController = PageController(viewportFraction: 0.85);
  AiTrainingPlanViewerScreen({super.key});

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
              ListTile(
                leading: Icon(Icons.fitness_center),
                title: Text(
                  "${plan.title} (${plan.plans.length} exercises)",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  formatDate(plan.startDate),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                flex: 2,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: plan.plans.length,
                  itemBuilder: (context, index) {
                    return TrainingPlanBlock(
                      index: index,
                      plan: plan.plans[index],
                    );
                  },
                ),
              ),
              TextButton(
                child: Chip(
                  label: Text(
                    "NEXT",
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: theme.primaryColor,
                    ),
                  ), // Text
                ), // Chip
                onPressed: () {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.linear,
                  );
                },
              ), // TextButton
              Spacer(),
            ],
          );
        },
      ),
    );
  }

  String formatDate(DateTime date) {
    return '${date.year}/${date.month}/${date.day}';
  }
}
