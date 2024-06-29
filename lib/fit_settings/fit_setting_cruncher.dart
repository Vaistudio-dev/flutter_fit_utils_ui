import 'package:flutter/material.dart';
import 'package:flutter_fit_utils_ui/fit_theme.dart';

import '../fit_text.dart';

/// Widget that manages 1 or multiple setting sections.
/// If this section contains too many element, it can be crunched, to the content is available in a sub-page.
class FitSettingsCruncher extends StatelessWidget {
  /// Set to [true] if the content should be crunched.
  final bool crunch;

  /// Texte to display if the content is crunched.
  final String crunchText;

  /// Subtitle to display if the content is crunched.
  final String? crunchSubtitle;

  /// Leading widget for the item.
  final Widget? leading;

  /// Widgets to potentially crunch.
  final List<Widget> children;

  /// Creates a new [FitSettingsCruncher].
  const FitSettingsCruncher({
    super.key,
    this.crunch = true,
    required this.crunchText,
    this.crunchSubtitle,
    required this.children,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    if (!crunch) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      );
    }

    return ListTile(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Scaffold(
              appBar: AppBar(
                title: FitText.title(crunchText),
              ),
              body: SafeArea(
                child: Container(
                  margin: FitTheme.of(context)?.pageMargin,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: children,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
      leading: leading,
      title: FitText.body(crunchText),
      subtitle: crunchSubtitle != null ? FitText.body(crunchSubtitle!) : null,
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
    );
  }
}
