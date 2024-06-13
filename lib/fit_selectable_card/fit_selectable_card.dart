import 'package:flutter/material.dart';
import 'package:flutter_fit_utils_ui/fit_theme.dart';

import '../fit_text.dart';

/// Outlined card with a title and description, that can be selected.
class FitSelectableCard extends StatelessWidget {
  /// Execute when tapping on the card.
  final void Function()? onTap;

  /// [true] if the card is selected.
  /// If selected, the outline is the primary color and a checkmark is displayed.
  final bool selected;

  /// Title of the card.
  final String title;

  /// Description dof the card.
  final String description;

  /// Creates a new [FitSelectableCard]
  const FitSelectableCard({
    super.key,
    this.onTap,
    this.selected = false,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final FitTheme fitTheme =
        FitTheme.of(context) ?? const FitTheme(child: SizedBox());
    final ThemeData appTheme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: fitTheme.baseRadius,
          border: Border.all(
            color: selected
                ? appTheme.colorScheme.primary
                : appTheme.colorScheme.secondary,
            width: 3,
          ),
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      color: selected
                          ? appTheme.colorScheme.primary
                          : appTheme.colorScheme.secondary,
                      shape: BoxShape.circle,
                    ),
                    child: selected
                        ? Icon(Icons.check,
                            size: 16, color: appTheme.colorScheme.background)
                        : null,
                  ),
                  FitText.body(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              FitText.body(
                description,
                margin: const EdgeInsets.only(top: 6),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
