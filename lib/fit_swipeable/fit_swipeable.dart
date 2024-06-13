import 'package:flutter/material.dart';

import 'swipe_option.dart';

/// Widget that can make it's child swipeable, by using a [Dismissible].
class FitSwipeable extends StatelessWidget {
  /// Swipe options.
  final SwipeOption options;

  /// Widget to make swipeable.
  final Widget child;

  /// Creates a new [FitSwipeable].
  const FitSwipeable({
    super.key,
    required this.options,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Dismissible(
          key: ValueKey(identityHashCode(child)),
          background: options.background,
          direction: options.dismissDirection,
          confirmDismiss: (direction) async {
            options.onSwiped();
            return options.dismiss;
          },
          child: child,
        );
      },
    );
  }
}
