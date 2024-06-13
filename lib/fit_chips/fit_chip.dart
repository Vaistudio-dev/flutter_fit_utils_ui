import 'package:flutter/material.dart';

import '../fit_text.dart';
import '../fit_theme.dart';

/// Wrapper for a simple chip.
class FitChip extends StatelessWidget {
  /// Text to display inside the chip.
  final String text;

  /// [true] if the chip is selected.
  /// If selected, a [FitChip] will be filled. Otherwise, it will be hollow.
  final bool selected;

  /// Execute when tapping the chip.
  final Function()? onTap;

  /// Creates a new [FitChip].
  const FitChip({
    super.key,
    required this.text,
    this.selected = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData appTheme = Theme.of(context);

    return OutlinedButton(
      onPressed: () {
        if (onTap != null) {
          onTap!();
        }
      },
      style: ButtonStyle(
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(
            color: (selected
                ? (appTheme.chipTheme.selectedColor ??
                    appTheme.colorScheme.primary)
                : (appTheme.chipTheme.secondarySelectedColor ??
                    appTheme.colorScheme.secondary)),
          ),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: FitTheme.of(context)?.baseRadius ??
              const BorderRadius.all(
                  Radius.circular(FitTheme.defaultBaseRadius)),
        )),
        backgroundColor: selected
            ? MaterialStateProperty.all<Color>(
                appTheme.chipTheme.selectedColor ??
                    appTheme.colorScheme.primary)
            : MaterialStateProperty.all<Color>(
                appTheme.chipTheme.secondarySelectedColor ??
                    appTheme.colorScheme.secondary),
      ),
      child: FitText.body(
        text,
        style: TextStyle(
          color: selected
              ? appTheme.colorScheme.onPrimary
              : appTheme.colorScheme.onSecondary,
        ),
      ),
    );
  }
}
