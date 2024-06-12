import 'dart:async';

import 'package:flutter/material.dart';

/// Diaporama d'images.
class FitDiaporama extends StatefulWidget {
  static const Duration _defaultAnimationTransition = Duration(seconds: 1);
  static const Duration _defaultImageDuration = Duration(seconds: 5);

  /// Images to display in the diaporama.
  final List<ImageProvider> images;

  /// Animation duration between images.
  final Duration animationDuration;

  /// Duration of a single image.
  final Duration imageDuration;

  /// If [true], the diaporama will stop once every image has been shown.
  final bool runOnce;

  /// Creates a new [FitDiaporama].
  const FitDiaporama({
    super.key,
    required this.images,
    this.animationDuration = _defaultAnimationTransition,
    this.imageDuration = _defaultImageDuration,
    this.runOnce = false,
  });

  @override
  State<FitDiaporama> createState() => _FitDiaporamaState();
}

class _FitDiaporamaState extends State<FitDiaporama> {
  Timer? timer;
  int imageIndex = 0;

  @override
  void initState() {
    super.initState();

    assert(widget.images.isNotEmpty, "Images cannot be empty.");

    timer = Timer.periodic(widget.imageDuration, (Timer t) {
      if (mounted) {
        setState(() {
          if (++imageIndex == widget.images.length) {
            if (widget.runOnce) {
              imageIndex = widget.images.length - 1;
              timer?.cancel();
              return;
            }

            imageIndex = 0;
          }
        });
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: widget.animationDuration,
      child: Container(
        key: ValueKey(imageIndex),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: widget.images[imageIndex],
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}
