import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EnterTodayExersiceScreen extends ConsumerWidget {
  const EnterTodayExersiceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.sports_gymnastics, size: 63, color: theme.primaryColor),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'abs workout, full body workout, etc.',
            ),
          ),
        ],
      ),
    );
  }
}
