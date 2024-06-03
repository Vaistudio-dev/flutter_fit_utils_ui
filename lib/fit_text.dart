import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

    switch (_role) {
      case "headline": return GoogleFonts.roboto(textStyle: appTheme.textTheme.headlineMedium?.merge(style));
      case "title": return GoogleFonts.roboto(textStyle: appTheme.textTheme.titleMedium?.merge(style));
      case "body": return GoogleFonts.roboto(textStyle: appTheme.textTheme.bodyMedium?.merge(style));
      case "button": return GoogleFonts.roboto(textStyle: appTheme.textTheme.labelMedium?.merge(style));
      case "tip": return GoogleFonts.roboto(textStyle: appTheme.textTheme.labelSmall?.merge(style));
      default: return style;
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