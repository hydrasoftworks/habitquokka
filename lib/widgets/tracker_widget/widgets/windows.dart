import 'package:flutter/material.dart';

import 'package:animated_emoji/animated_emoji.dart';
import 'package:collection/collection.dart';

import 'package:habitquokka/widgets/tracker_widget/widgets/window.dart';

typedef OnWindowPressed = void Function(String);

class Windows extends StatelessWidget {
  const Windows({
    super.key,
    required this.rows,
    required this.columns,
    required this.indexes,
    required this.emojis,
    required this.opened,
    required this.showEmojis,
    required this.onWindowPressed,
  });

  final int rows;
  final int columns;
  final Map<String, int> indexes;
  final List<AnimatedEmojiData> emojis;
  final Set<String> opened;
  final bool showEmojis;
  final OnWindowPressed onWindowPressed;

  @override
  Widget build(BuildContext context) {
    final smallestUnopenedKey = _calculateSmallestUnopenedKey(indexes, opened);

    return Table(
      children: List.generate(
        rows,
        (rowIndex) => TableRow(
          children: List.generate(
            columns,
            (columnIndex) {
              final key = '$rowIndex-$columnIndex';
              final index = rowIndex * columns + columnIndex;
              return _buildWindow(
                index: index,
                key: key,
                highlighted: smallestUnopenedKey == key,
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildWindow({
    required int index,
    required String key,
    required bool highlighted,
  }) {
    return AspectRatio(
      key: ValueKey(key),
      aspectRatio: 1,
      child: Window(
        onPressed: () => onWindowPressed(key),
        text: indexes[key].toString(),
        emoji: showEmojis ? emojis[index] : null,
        isOpened: opened.contains(key),
        isHighlighted: highlighted,
      ),
    );
  }

  String? _calculateSmallestUnopenedKey(
    Map<String, int> indexes,
    Set<String> opened,
  ) {
    if (indexes.length == opened.length) return null;

    return indexes.entries
        .sorted((lhs, rhs) => lhs.value.compareTo(rhs.value))
        .firstWhereOrNull((entry) => !opened.contains(entry.key))
        ?.key;
  }
}
