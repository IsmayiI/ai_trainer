import 'package:ai_trainer/core/models/training_plan.model.dart';
import 'package:flutter/material.dart';

class TrainingPlanBlock extends StatelessWidget {
  final int index;
  final PlanItem plan;

  const TrainingPlanBlock({super.key, required this.index, required this.plan});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: theme.primaryColor.withAlpha(100),
      ), // BoxDecoration
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${index + 1}', style: textTheme.displaySmall),
          Text(
            plan.exercise,
            style: textTheme.displayMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(),
          Row(
            children: [
              Text('${plan.sets}', style: textTheme.displaySmall),
              SizedBox(width: 5),
              Text("SETS"),
            ],
          ),
          SizedBox(width: 10),
          Row(
            children: [
              Text(plan.reps.join(' | '), style: textTheme.displaySmall),
              SizedBox(width: 5),
              Text("REPS"),
            ],
          ),
          SizedBox(width: 10),
          Row(
            children: [
              Text(plan.weights.join(' | '), style: textTheme.displaySmall),
              SizedBox(width: 5),
              Text("WEIGHTS"),
            ],
          ),
        ],
      ), // Column
    ); // Container
  }
}
