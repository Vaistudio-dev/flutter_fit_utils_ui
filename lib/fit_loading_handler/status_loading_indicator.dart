import 'package:flutter/material.dart';

import '../fit_text.dart';
import '../fit_theme.dart';

/// Loading indicator with a text for indicating what is going on in the
/// background.
class StatusLoadingIndicator extends StatelessWidget {
  final String? status;

  final BoxConstraints constraints;

  const StatusLoadingIndicator({
    super.key,
    this.status,
    this.constraints = const BoxConstraints(
      minWidth: 200,
      minHeight: 120,
      maxHeight: 120,
      maxWidth: 300,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      constraints: constraints,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: FitTheme.maybeOf(context)?.baseRadius,
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 20,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        spacing: 12,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          if (status != null)
            FitText.hint(
              status!,
              textAlign: TextAlign.center,
            ),
        ],
      ),
    );
  }
}
