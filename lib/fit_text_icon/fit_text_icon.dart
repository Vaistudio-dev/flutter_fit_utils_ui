import 'package:flutter/material.dart';
import 'package:flutter_fit_utils_ui/fit_text_icon/fit_text_icon_theme_data.dart';

import '../fit_text.dart';
import '../fit_theme.dart';

/// [FitText] paired with an [Icon] and vice-versa. Can be displayed either way.
class FitTextIcon extends StatelessWidget {
  /// Theming properties that will override the ones in [FitTheme].
  final FitTextIconThemeData? themeData;

  /// Text to display.
  final FitText text;

  /// Icon to display.
  final Icon icon;

  /// Creates a new [FitTextIcon].
  const FitTextIcon(
      {super.key, required this.text, required this.icon, this.themeData});

  @override
  Widget build(BuildContext context) {
    final FitTheme? fitTheme = FitTheme.maybeOf(context);
    final FitTextIconThemeData data = themeData ??
        fitTheme?.fitTextIconThemeData ??
        const FitTextIconThemeData();

    final List<Widget> widgets = [];

    if (data.contentOrder == TextIconOrder.ti) {
      widgets.add(Container(
        padding: EdgeInsets.only(right: data.spacing),
        child: text,
      ));
      widgets.add(icon);
    } else {
      widgets.add(Container(
        padding: EdgeInsets.only(right: data.spacing),
        child: icon,
      ));
      widgets.add(text);
    }

    return Container(
      margin: data.margin,
      padding: data.padding,
      child: Row(
        mainAxisAlignment: data.mainAxisAlignment,
        crossAxisAlignment: data.crossAxisAlignment,
        children: widgets,
      ),
    );
  }
}
