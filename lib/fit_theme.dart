import 'package:flutter/material.dart';
import 'package:flutter_fit_utils_ui/flutter_fit_utils_ui.dart';

/// Theme data with extended functionnalities.
class FitTheme extends InheritedWidget {
  /// Base radius by default, 22 pixels.
  static const double defaultBaseRadius = 22;

  /// Base text style. This style will be applied to all fit ui components
  /// that uses the [Text] widget.
  /// For example, use this base style to set the font family.
  final TextStyle? baseTextStyle;

  /// Size to use to display [FitLoadingIndicator].
  /// You can override the size for individual loading indicators if needed.
  final Size loadingIndicatorSize;

  /// Theming properties for [FitTextIcon].
  /// You can override the theme data for individual [FitTextIcon] if needed.
  final FitTextIconThemeData fitTextIconThemeData;

  /// Theming properties for [FitMenu].
  /// You can override the theme data for individual [FitMenu] if needed.
  final FitMenuThemeData fitMenuThemeData;

  /// Behavior for all [FitLoadingHandler].
  final FitLoadingHandlerBehavior loadingBehavior;

  /// Margin that should be applied on all pages.
  final EdgeInsets? pageMargin;

  /// Base radius.
  /// Use it for cards, images, etc.
  final BorderRadius baseRadius;

  BorderRadius get innerRadius =>
      BorderRadius.all(Radius.circular(baseRadius.bottomLeft.x / 2));

  /// Creates a new intance of [FitTheme].
  const FitTheme({
    super.key,
    required super.child,
    this.baseTextStyle,
    this.pageMargin,
    this.loadingIndicatorSize = FitLoadingIndicator.defaultSize,
    this.fitTextIconThemeData = const FitTextIconThemeData(),
    this.fitMenuThemeData = const FitMenuThemeData(),
    this.loadingBehavior = const FitLoadingHandlerBehavior(),
    this.baseRadius =
        const BorderRadius.all(Radius.circular(defaultBaseRadius)),
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
