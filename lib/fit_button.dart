import 'package:flutter/material.dart';

import 'fit_theme.dart';

/// Wrapper for buttons.
class FitButton extends StatelessWidget {
  /// Execute when tapping on the button.
  final Function()? onTap;

  /// Execute when long pressing on the button.
  final Function()? onLongPress;

  /// Width of the button.
  final double? width;

  /// Height of the button.
  final double? height;

  /// Margin of the button.
  final EdgeInsets? margin;

  /// Padding of the button.
  final EdgeInsets? padding;

  /// Widget to display inside the button.
  final Widget child;

  /// Creates a new [FitButton].
  const FitButton({
    super.key,
    this.onTap,
    required this.child,
    this.onLongPress,
    this.margin,
    this.padding,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final FitTheme? fitTheme = FitTheme.of(context);

    ButtonStyle? style;
    if (fitTheme != null) {
      style = ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: fitTheme.baseRadius,
          ),
        ),
      );
    }

    return Container(
      width: width,
      height: height ?? Theme.of(context).buttonTheme.height,
      margin: margin,
      padding: padding,
      child: FilledButton(
        onPressed: onTap,
        onLongPress: onLongPress,
        style: style,
        child: child,
      ),
    );
  }
}
