import 'dart:math' as math;

import 'package:habitquokka/models/tracker.dart';

extension Numbers on Tracker {
  Map<String, int> randomizedNumbers(math.Random random) {
    final indexes = List.generate(
      rows * columns,
      (index) => index + 1,
    );
    indexes.shuffle(random);

    final map = <String, int>{};
    for (int row = 0; row < rows; row++) {
      for (int column = 0; column < columns; column++) {
        map['$row-$column'] = indexes[row * columns + column];
      }
    }
    return map;
  }

  Map<String, int> orderedNumbers() {
    final numbers = rows * columns;
    final map = <String, int>{};
    int topRow = 0;
    int bottomRow = rows - 1;
    int leftColumn = 0;
    int rightColumn = columns - 1;
    int number = 1;

    while (number <= numbers) {
      // Assign top row
      for (int column = leftColumn; column <= rightColumn; column++) {
        map['$topRow-$column'] = number;
        number++;
      }
      if (number > numbers) break;

      // Assign right column
      for (int row = topRow + 1; row <= bottomRow; row++) {
        map['$row-$rightColumn'] = number;
        number++;
      }
      if (number > numbers) break;

      // Assign bottom row
      for (int column = rightColumn - 1; column >= leftColumn; column--) {
        map['$bottomRow-$column'] = number;
        number++;
      }
      if (number > numbers) break;

      // Assign left column
      for (int row = bottomRow - 1; row >= topRow + 1; row--) {
        map['$row-$leftColumn'] = number;
        number++;
      }
      if (number > numbers) break;

      topRow++;
      bottomRow--;
      leftColumn++;
      rightColumn--;
    }

    return map;
  }
}
