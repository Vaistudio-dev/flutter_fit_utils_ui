import 'package:flutter/material.dart';

/// Parameters for a [FitSwipeable].
class SwipeOption {
  /// Background of the dismissible.
  final Widget? background;
  /// Swipe direction.
  final DismissDirection dismissDirection;

  /// If [true], the swipeable item will disapear when swiped.
  final bool dismiss;

  /// Execute when an item is swiped.
  final Function() onSwiped;

  /// Creates a new [SwipeOption].
  const SwipeOption({required this.onSwiped, required this.dismissDirection, this.background, this.dismiss = false});

  /// Creates a new [SwipeOption] with presets to add an item when swiping.
  const SwipeOption.add({required this.onSwiped, this.dismissDirection = DismissDirection.endToStart, required this.background, this.dismiss = false});

  /// Creates a new [SwipeOption] with presets to remove an item when swiping.
  const SwipeOption.delete({required this.onSwiped, this.dismissDirection = DismissDirection.startToEnd, required this.background, this.dismiss = true});
}