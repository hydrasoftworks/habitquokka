import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:animated_emoji/animated_emoji.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:murmur3/murmur3.dart';

import 'package:habitquokka/models/emoji.dart';
import 'package:habitquokka/models/tracker.dart';
import 'package:habitquokka/widgets/tracker_widget/widgets/image_origin_text.dart';
import 'package:habitquokka/widgets/tracker_widget/widgets/windows.dart';

typedef OnWindowPressed = void Function(String);

class TrackerWidget extends StatefulWidget {
  const TrackerWidget({
    super.key,
    required this.tracker,
    required this.opened,
    required this.onWindowPressed,
  });

  final Tracker tracker;
  final Set<String> opened;
  final OnWindowPressed onWindowPressed;

  @override
  State<TrackerWidget> createState() => _TrackerWidgetState();
}

class _TrackerWidgetState extends State<TrackerWidget> {
  late List<int> _indexes;
  late List<AnimatedEmojiData> _emojis;

  bool _isDataLoaded = false;

  bool get _areAllWindowsOpened => widget.opened.length == _indexes.length;

  @override
  void initState() {
    super.initState();
    _setupLists();
  }

  Future<void> _setupLists() async {
    final seed = await murmur3a(widget.tracker.id);

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
    setState(() => _isDataLoaded = true);
  }

  @override
  Widget build(BuildContext context) {
    if (!_isDataLoaded) {
      return const Center(child: CircularProgressIndicator());
    }

    return AspectRatio(
      aspectRatio: widget.tracker.columns / widget.tracker.rows,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CachedNetworkImage(
            imageUrl: widget.tracker.image.imageUrl,
            fit: BoxFit.cover,
          ),
          Windows(
            onWindowPressed: widget.onWindowPressed,
            rows: widget.tracker.rows,
            columns: widget.tracker.columns,
            indexes: _indexes,
            emojis: _emojis,
            opened: widget.opened,
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
