import 'package:flutter/material.dart';

import 'fit_text.dart';

extension UIContextExtension on BuildContext {
  /// Affiche un [SnackBar].
  void showSnackbar(String text) {
    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        duration: const Duration(seconds: 3),
        backgroundColor: Theme.of(this).colorScheme.secondary,
        behavior: SnackBarBehavior.floating,
        elevation: 3,
        margin: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
        content: FitText.body(
          text,
          style: TextStyle(color: Theme.of(this).colorScheme.onSecondary),
        ),
      ));
  }
}
