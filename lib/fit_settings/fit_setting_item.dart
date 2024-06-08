import 'package:flutter/material.dart';

import '../fit_text.dart';

/// Setting item.
class FitSettingItem extends StatelessWidget {
  /// Title of the setting.
  final String title;

  /// Subtitle of the setting, can be used to show the value.
  final String subtitle;

  /// Execute when tapping the setting item.
  final void Function()? onTap;

  /// Set to [true] to show that the setting has potentially dangerous consequences.
  final bool danger;

  /// Set to [true] if the user has to authenticate before using the setting, for security purposes.
  /// Use for something like deleting an account, or before showing sensitive data.
  final bool locked;

  /// Creates a new [settingItem].
  const FitSettingItem({super.key, required this.title, this.subtitle = "", this.onTap, this.danger = false, this.locked = false});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: FitText.body(
        title,
      ),
      subtitle: subtitle != "" ? FitText.hint(
        subtitle,
      ) : null,
    );
  }
}