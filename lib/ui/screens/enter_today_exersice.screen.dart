import 'package:ai_trainer/core/screens_controllers/ai_trainer.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EnterTodayExersiceScreen extends ConsumerWidget {
  final formKey = GlobalKey<FormState>();
  final formController = TextEditingController(text: 'dddddd');
  EnterTodayExersiceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.sports_gymnastics, size: 63, color: theme.primaryColor),
            Text(
              'What exercise are we doing today?',
              textAlign: TextAlign.center,
              style: theme.textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Form(
              key: formKey,
              child: TextFormField(
                controller: formController,
                validator: ref
                    .read(aiTrainerControllerProvider.notifier)
                    .validator,
                decoration: InputDecoration(
                  hintText: 'abs workout, full body workout, etc.',
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (!formKey.currentState!.validate()) return;
          ref
              .read(aiTrainerControllerProvider.notifier)
              .generate(formController.text);
          Navigator.pushNamed(context, '/plan');
        },
        child: Icon(Icons.send),
      ),
    );
  }
}
