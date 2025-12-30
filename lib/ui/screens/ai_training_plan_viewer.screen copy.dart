import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AiTrainingPlanViewerScreen extends ConsumerWidget {
  const AiTrainingPlanViewerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('AI Trainer')),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          
        ],
      ),
    );
  }
}
