import 'package:flutter/material.dart';

/// Content order for a [TextIcon].
enum TextIconOrder {
  /// Text - Icon
  ti,

  /// Icon - Text
  it
}

/// Theming properties of a [FitTextIcon].
class FitTextIconThemeData {
  static const double _defaultSpacing = 4;
  static const MainAxisAlignment _defaultMainAxisAlignment =
      MainAxisAlignment.start;
  static const CrossAxisAlignment _defaultCrossAxisAlignment =
      CrossAxisAlignment.center;
  static const TextIconOrder _defaultContentOrder = TextIconOrder.it;

  /// Margin of the row wrapping the content.
  final EdgeInsets? margin;

  /// Padding of the row wrapping the content.
  final EdgeInsets? padding;

  /// Horizontal spacing, in pixels, between the text and the icon. 4 pixels by
  /// default.
  final double spacing;

  /// Main axis alignment of the row wrapping the content.
  final MainAxisAlignment mainAxisAlignment;

  /// Cross axis alignment of the row wrapping the content.
  final CrossAxisAlignment crossAxisAlignment;

  /// Order of the content.
  final TextIconOrder contentOrder;

  /// Creates a new [FitTextIconThemeData].
  const FitTextIconThemeData({
    this.margin,
    this.padding,
    this.spacing = _defaultSpacing,
    this.mainAxisAlignment = _defaultMainAxisAlignment,
    this.crossAxisAlignment = _defaultCrossAxisAlignment,
    this.contentOrder = _defaultContentOrder,
  });
}
