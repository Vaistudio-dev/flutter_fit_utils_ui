import 'package:flutter/material.dart';

import 'fit_text.dart';
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

  /// Background color of the button.
  final Color? color;

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
    this.color,
  });

  /// Creates a new [FitButton] with the child set as a [FitText.button].
  FitButton.text(String text, {
    super.key,
    this.onTap,
    this.onLongPress,
    this.margin,
    this.padding,
    this.width,
    this.height,
    this.color,
  }) : child = FitText.button(text);

  @override
  Widget build(BuildContext context) {
    final FitTheme? fitTheme = FitTheme.maybeOf(context);

    ButtonStyle style = ButtonStyle(
      shape: fitTheme != null ? WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: fitTheme.baseRadius,
        ),
      ) : null,
      backgroundColor: color != null ? WidgetStateProperty.all<Color>(color!) : null,
    );

    return Container(
      width: width ?? Theme.of(context).buttonTheme.minWidth,
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
