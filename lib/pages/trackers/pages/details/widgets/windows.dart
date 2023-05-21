import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:habit_quokka/pages/trackers/pages/details/widgets/window.dart';

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

  @override
  void initState() {
    super.initState();
    _indexes = List.generate(
      widget.rows * widget.columns,
      (index) => index + 1,
    );
    if (widget.seed != null) _indexes.shuffle(math.Random(widget.seed));
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
