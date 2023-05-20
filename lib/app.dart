import 'package:flutter/material.dart';
import 'package:habit_quokka/pages/habit_tracker/habit_tracker.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      home: const HabitCalendar(
        rows: 5,
        columns: 6,
        image: 'https://picsum.photos/500?image=9',
        seedColor: Colors.blue,
      ),
    );
  }
}
