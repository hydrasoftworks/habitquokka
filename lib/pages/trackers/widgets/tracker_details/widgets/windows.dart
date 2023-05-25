import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:animated_emoji/emojis.dart';

import 'package:habit_quokka/pages/trackers/widgets/tracker_details/widgets/window.dart';

class Windows extends StatefulWidget {
  const Windows({
    super.key,
    required this.rows,
    required this.columns,
    this.seed,
  });

  final int rows;
  final int columns;
  final int? seed;

  @override
  State<Windows> createState() => _WindowsState();
}

class _WindowsState extends State<Windows> {
  final Set<String> _opened = {};
  late List<int> _indexes;
  late List<AnimatedEmojiData> _emojis;

  @override
  void initState() {
    super.initState();
    _indexes = List.generate(
      widget.rows * widget.columns,
      (index) => index + 1,
    );
    _emojis = List.of(AnimatedEmojis.values);
    if (widget.seed != null) {
      final random = math.Random(widget.seed);
      _indexes.shuffle(random);
      _emojis.shuffle(random);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Table(
      children: List.generate(
        widget.rows,
        (rowIndex) => TableRow(
          children: List.generate(
            widget.columns,
            (columnIndex) {
              final key = '$rowIndex-$columnIndex';
              final index = rowIndex * widget.columns + columnIndex;
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
        text: _indexes[index].toString(),
        emoji: _emojis[index],
        isOpened: _opened.contains(key),
        onPressed: () {
          setState(() {
            if (_opened.contains(key)) {
              _opened.remove(key);
            } else {
              _opened.add(key);
            }
          });
        },
      ),
    );
  }
}
