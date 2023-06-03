import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:animated_emoji/animated_emoji.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:habitquokka/models/emoji.dart';
import 'package:habitquokka/models/tracker.dart';
import 'package:habitquokka/widgets/tracker_widget/widgets/image_origin_text.dart';
import 'package:habitquokka/widgets/tracker_widget/widgets/windows.dart';

class TrackerWidget extends StatefulWidget {
  const TrackerWidget({
    super.key,
    required this.tracker,
  });
  final Tracker tracker;

  @override
  State<TrackerWidget> createState() => _TrackerWidgetState();
}

class _TrackerWidgetState extends State<TrackerWidget> {
  late List<int> _indexes;
  late List<AnimatedEmojiData> _emojis;
  final Set<String> _opened = {};

  bool get _areAllWindowsOpened => _opened.length == _indexes.length;

  @override
  void initState() {
    super.initState();
    final seed = widget.tracker.id.hashCode;
    _indexes = List.generate(
      widget.tracker.rows * widget.tracker.columns,
      (index) => index + 1,
    );
    _emojis = List.of(Emoji.all);
    if (widget.tracker.randomizeNumbers) {
      final random = math.Random(seed);
      _indexes.shuffle(random);
      _emojis.shuffle(random);
    }
    _emojis = _emojis.take(_indexes.length).toList(growable: false);
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widget.tracker.columns / widget.tracker.rows,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CachedNetworkImage(
            imageUrl: widget.tracker.image.rawUrl,
            fit: BoxFit.cover,
          ),
          Windows(
            onWindowPressed: (key) {
              setState(
                () => _opened.contains(key)
                    ? _opened.remove(key)
                    : _opened.add(key),
              );
            },
            rows: widget.tracker.rows,
            columns: widget.tracker.columns,
            indexes: _indexes,
            emojis: _emojis,
            opened: _opened,
          ),
          if (_areAllWindowsOpened)
            Align(
              alignment: Alignment.bottomRight,
              child: ImageOriginText(image: widget.tracker.image),
            ),
        ],
      ),
    );
  }
}
