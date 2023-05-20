import 'package:flutter/material.dart';
import 'package:habit_quokka/pages/habit_tracker/widgets/windows.dart';

class HabitCalendar extends StatelessWidget {
  const HabitCalendar({
    super.key,
    required this.image,
    required this.rows,
    required this.columns,
    required this.seedColor,
  });

  final int rows;
  final int columns;
  final String image;
  final Color seedColor;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: seedColor,
          brightness: MediaQuery.of(context).platformBrightness,
        ),
        useMaterial3: true,
      ),
      child: Scaffold(
        body: Center(
          child: AspectRatio(
            aspectRatio: columns / rows,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
                Windows(
                  rows: rows,
                  columns: columns,
                  seed: image.hashCode,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
