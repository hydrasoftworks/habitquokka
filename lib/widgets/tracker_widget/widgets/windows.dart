import 'package:flutter/material.dart';

import 'package:animated_emoji/emojis.dart';

import 'package:habitquokka/widgets/tracker_widget/widgets/window.dart';

typedef WindowPressedCallback = void Function(String);

class Windows extends StatelessWidget {
  const Windows({
    super.key,
    required this.rows,
    required this.columns,
    required this.indexes,
    required this.emojis,
    required this.opened,
    required this.onWindowPressed,
  });

  final int rows;
  final int columns;
  final List<int> indexes;
  final List<AnimatedEmojiData> emojis;
  final Set<String> opened;
  final WindowPressedCallback onWindowPressed;

  @override
  Widget build(BuildContext context) {
    return Table(
      children: List.generate(
        rows,
        (rowIndex) => TableRow(
          children: List.generate(
            columns,
            (columnIndex) {
              final key = '$rowIndex-$columnIndex';
              final index = rowIndex * columns + columnIndex;
              return _buildWindow(index, key);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildWindow(int index, String key) {
    return AspectRatio(
      key: ValueKey(key),
      aspectRatio: 1,
      child: Window(
        text: indexes[index].toString(),
        emoji: emojis[index],
        isOpened: opened.contains(key),
        onPressed: () => onWindowPressed(key),
      ),
    );
  }
}
