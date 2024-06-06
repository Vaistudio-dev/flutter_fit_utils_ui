import 'package:flutter/material.dart';
import 'package:flutter_fit_utils_ui/fit_theme.dart';

/// [Text] widget with pre-built styles:
/// Headline: based on TextTheme.headlineLarge.
/// Title: based on TextTheme.titleLarge.
/// Body: based on TextTheme.bodyLarge.
/// Button: based on TextTheme.bodyLarge.
/// Tip: based on TextTheme.labelSmall.
/// 
/// The text style is also based on FitTheme.baseTextStyle.
/// Here is the order for merging the 3 styles together:
/// 1. Role style (headline, title, etc.)
/// 2. Base style (from FitTheme)
/// 3. Custom stlye ([FitText.style])
/// 
/// [FiText] may also automatically wrap the [Text] widget inside a [Container],
/// if necessary. To be wrapped in a [Container], at least one of the following
/// properties needs to be non null:
/// - [FitText.alignment]
/// - [FitText.margin]
/// - [FitText.padding]
/// - [FitText.width]
/// - [FitText.height]
class FitText extends StatelessWidget {
  final String _role;

  /// Text to display.
  final String text;

  /// Custom styling to apply.
  /// This style will override the role style (Headline, Title, Body, Button, Tip)
  /// and [FitTheme.baseTextStyle].
  final TextStyle? style;

  /// [Text.textAlign].
  final TextAlign? textAlign;

  /// [Text.overflow]
  final TextOverflow? overflow;

  /// Margin for the text.
  final EdgeInsets? margin;

  /// Padding for the text.
  final EdgeInsets? padding;

  /// Width of the text.
  final double? width;

  /// Height of the text.
  final double? height;

  /// Alignment of the container wrapping the text.
  final Alignment? alignment;

  /// [Text.maxLines].
  final int? maxLines;

  /// Creates a basic text with no role styling.
  const FitText(
    this.text, {
    super.key,
    this.style,
    this.margin,
    this.padding,
    this.textAlign,
    this.width,
    this.height,
    this.alignment,
    this.maxLines = 5,
    this.overflow,
  }) : _role = "";

  /// Creates a headline text with the headline role.
  const FitText.headline(
    this.text, {
    super.key,
    this.style,
    this.margin,
    this.padding,
    this.textAlign,
    this.width,
    this.height,
    this.alignment,
    this.maxLines = 5,
    this.overflow,
  }) : _role = "headline";

  /// Creates a title text with the title role.
  const FitText.title(
    this.text, {
    super.key,
    this.style,
    this.margin,
    this.padding,
    this.textAlign,
    this.width,
    this.height,
    this.alignment,
    this.maxLines = 5,
    this.overflow,
  }) : _role = "title";

  /// Creates a body text with the body role.
  const FitText.body(
    this.text, {
    super.key,
    this.style,
    this.margin,
    this.padding,
    this.textAlign,
    this.width,
    this.height,
    this.alignment,
    this.maxLines = 5,
    this.overflow,
  }) : _role = "body";

  /// Creates a button text with the button role.
  const FitText.button(
    this.text, {
    super.key,
    this.style,
    this.margin,
    this.padding,
    this.textAlign,
    this.width,
    this.height,
    this.alignment,
    this.maxLines = 5,
    this.overflow,
  }) : _role = "button";

  /// Creates a tip text with the tip role.
  const FitText.tip(
    this.text, {
    super.key,
    this.style,
    this.margin,
    this.padding,
    this.textAlign,
    this.width,
    this.height,
    this.alignment,
    this.maxLines = 5,
    this.overflow,
  }) : _role = "tip";

  TextStyle? _getStyle(BuildContext context) {
    final ThemeData appTheme = Theme.of(context);
    final FitTheme? fitTheme = FitTheme.of(context);

    TextStyle applyStylingOrder(mainStyle) =>
        mainStyle?.merge(fitTheme?.baseTextStyle?.merge(style) ?? style) ??
        (fitTheme?.baseTextStyle?.merge(style) ?? style);

    switch (_role) {
      case "headline":
        return applyStylingOrder(appTheme.textTheme.headlineLarge);
      case "title":
        return applyStylingOrder(appTheme.textTheme.titleLarge);
      case "body":
        return applyStylingOrder(appTheme.textTheme.bodyLarge);
      case "button":
        return applyStylingOrder(appTheme.textTheme.bodyLarge?.copyWith(
          color: appTheme.colorScheme.onPrimary,
        ));
      case "tip":
        return applyStylingOrder(appTheme.textTheme.labelSmall);
      default:
        return applyStylingOrder(null);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Text textWidget = Text(
      text,
      textAlign: textAlign,
      style: _getStyle(context),
      maxLines: maxLines,
      overflow: overflow,
    );

    return [alignment, margin, padding, width, height]
            .any((element) => element != null)
        ? Container(
            alignment: alignment,
            margin: margin,
            padding: padding,
            width: width,
            height: height,
            child: textWidget,
          )
        : textWidget;
  }
}
