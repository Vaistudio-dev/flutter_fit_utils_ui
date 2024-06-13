import 'package:flutter/material.dart';

import 'fit_theme.dart';

/// [CircularProgressIndicator] that has by default a size of 50 x 50 pixels.
/// You can theme this widget with [ProgressIndicatorThemeData].
/// You can also set the default size inside [FitTheme].
class FitLoadingIndicator extends StatelessWidget {
  /// Default size for the loading indicator. 50 x 50 pixels.
  static const Size defaultSize = Size(50, 50);

  /// Size of the loading indicator.
  final Size? size;

  /// Alignment of the indicator. Centered by default.
  final Alignment? alignment;

  /// Creates a new [FitLoadingIndicator].
  const FitLoadingIndicator({super.key, this.size, this.alignment});

  @override
  Widget build(BuildContext context) {
    final ThemeData appTheme = Theme.of(context);
    final FitTheme? fitTheme = FitTheme.of(context);

    return Container(
      alignment: alignment ?? Alignment.center,
      color: appTheme.scaffoldBackgroundColor,
      child: SizedBox(
        width: size?.width ??
            fitTheme?.loadingIndicatorSize.width ??
            defaultSize.width,
        height: size?.height ??
            fitTheme?.loadingIndicatorSize.height ??
            defaultSize.height,
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
