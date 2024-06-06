import 'package:flutter/material.dart';
import 'package:flutter_fit_utils_ui/fit_loading_indicator.dart';

/// Theme data with extended functionnalities.
class FitTheme extends InheritedWidget {
  /// Base text style. This style will be applied to all fit ui components
  /// that uses the [Text] widget.
  /// For example, use this base style to set the font family.
  final TextStyle? baseTextStyle;

  /// Size to use to display [FitLoadingIndicator].
  /// You can override the size for individual loading indicators if needed.
  final Size loadingIndicatorSize;

  /// Creates a new intance of [FitTheme].
  const FitTheme({
    super.key,
    required super.child,
    this.baseTextStyle,
    this.loadingIndicatorSize = FitLoadingIndicator.defaultSize
  });

  /// Gets the closest [FitTheme] in the Widget Tree.
  static FitTheme? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<FitTheme>();
  }

  @override
  bool updateShouldNotify(FitTheme oldWidget) {
    return oldWidget.baseTextStyle != baseTextStyle;
  }
}
