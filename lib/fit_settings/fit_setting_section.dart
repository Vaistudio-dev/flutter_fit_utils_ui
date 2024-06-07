import 'package:flutter/material.dart';

import '../fit_text.dart';
import 'setting_spacer.dart';

/// A delimited section of settings.
class SettingSection extends StatelessWidget {
  /// Title of the section.
  final String? title;

  /// List of the settings.
  final List<Widget> children;

  /// Spacing at the top of the section.
  final SettingSpacer topSpacer;

  /// Creates a new [FitSettingSection].
  const SettingSection({super.key, this.title, this.topSpacer = const SettingSpacer(), required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        topSpacer,
        if (title != null)
          FitText.title(title!),
        for (final child in children)
          child,
      ],
    );
  }
}