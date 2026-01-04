import 'package:ai_trainer/ui/screens/ai_training_plan_viewer.screen.dart';
import 'package:ai_trainer/ui/screens/enter_today_exersice.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
      ),
      routes: {
        '/': (context) => EnterTodayExersiceScreen(),
        '/plan': (context) => AiTrainingPlanViewerScreen(),
      },
    );
  }
}
