import 'package:flutter/material.dart';

import 'fit_text.dart';
import 'fit_theme.dart';

/// Card with a background image, title and subtitle.
/// There is a gradient applied on top of the image to ensure the title and subtitle
/// are readable, no matter the image.
class FitImageCard extends StatelessWidget {
  /// Background image of the card.
  final ImageProvider<Object> image;

  /// Execute when tapping the card.
  final void Function() onTap;

  /// Height of the card, in pixels.
  final double height;

  /// Title of the card.
  final String? title;

  /// Subtitle of the card.
  final String? description;

  /// Color to use for the title and description.
  /// Defaults to ColorScheme.onPrimary.
  final Color? textColor;

  /// Creates a new [FitImageCard].
  const FitImageCard({
    super.key,
    required this.onTap,
    required this.image,
    this.title,
    this.description,
    this.height = 250,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final FitTheme? fitTheme = FitTheme.of(context);

    return Container(
      width: double.infinity,
      height: height,
      margin: Theme.of(context).cardTheme.margin,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: fitTheme?.baseRadius,
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: image,
                fit: BoxFit.fill,
              ),
              borderRadius: fitTheme?.baseRadius,
            ),
          ),
          Container(
            width: double.infinity,
            height: height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withValues(alpha: 0.1),
                  Colors.black,
                ],
              ),
              borderRadius: fitTheme?.baseRadius,
            ),
          ),
          Material(
            color: Colors.transparent,
            borderRadius: fitTheme?.baseRadius,
            child: InkWell(
              onTap: onTap,
              borderRadius: fitTheme?.baseRadius,
              child: Container(
                margin: const EdgeInsets.only(bottom: 24, left: 24),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (title != null)
                      FitText.title(
                        title!,
                        style: TextStyle(
                          color: textColor ?? Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    if (description != null)
                      FitText.body(
                        description!,
                        style: TextStyle(
                          color: textColor ?? Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
