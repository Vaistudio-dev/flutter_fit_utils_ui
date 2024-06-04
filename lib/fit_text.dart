import 'package:flutter/material.dart';
import 'package:flutter_fit_utils_ui/theme/fit_theme.dart';

/// Texte style FitLog.
class FitText extends StatelessWidget {
  final String _role;

  /// Texte à afficher.
  final String text;
  /// Style du texte
  final TextStyle? style;
  /// Alignement du texte.
  final TextAlign? textAlign;

  /// Style d'overflow du texte.
  final TextOverflow? overflow;

  /// Margin du texte.
  final EdgeInsets? margin;
  /// Padding du texte.
  final EdgeInsets? padding;

  /// Largeur du texte.
  final double? width;
  /// Hauteur du texte.
  final double? height;

  /// Alignement du conteneur du texte.
  final Alignment? alignment;

  /// Nombre de lignes maximum.
  final int? maxLines;

  /// Texte style FitLog.
  const FitText(this.text, {
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

  /// Créer un texte avec le style d'un titre.
  const FitText.headline(this.text, {
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

  /// Créer un texte avec le style d'un sous-titre.
  const FitText.title(this.text, {
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

  /// Créer un texte avec le style d'un corps de texte.
  const FitText.body(this.text, {
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

  /// Créer un texte avec le style d'un bouton.
  const FitText.button(this.text, {
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

  /// Créer un texte avec le style d'un astuce.
  const FitText.tip(this.text, {
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

    getStyle(mainStyle) => mainStyle?.merge(fitTheme?.baseTextStyle?.merge(style)) ?? (fitTheme?.baseTextStyle?.merge(style) ?? style);

    switch (_role) {
      case "headline": return getStyle(appTheme.textTheme.headlineLarge);
      case "title": return getStyle(appTheme.textTheme.titleLarge);
      case "body": return getStyle(appTheme.textTheme.bodyLarge);
      case "button": return getStyle(appTheme.textTheme.labelLarge);
      case "tip": return getStyle(appTheme.textTheme.labelSmall);
      default: return getStyle(null);
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

    return [alignment, margin, padding, width, height].any((element) => element != null) ?
      Container(
        alignment: alignment,
        margin: margin,
        padding: padding,
        width: width,
        height: height,
        child: textWidget,
      ) :
      textWidget;
  }
}