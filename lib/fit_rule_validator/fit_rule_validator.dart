import 'package:flutter/material.dart';
import 'package:flutter_fit_utils_ui/fit_rule_validator/validator.dart';

import '../fit_text.dart';

/// Widget that displays the validity of a dataset according to certain rules.
class FitRuleValidator extends StatelessWidget {
  /// Data to validate.
  final RuleValidator data;

  /// Creates a new [FitRuleValidator].
  const FitRuleValidator({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final rule in data.validate().entries)
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            child: Row(
              children: [
                Container(
                  width: 10,
                  height: 10,
                  margin: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    color: rule.value
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.error,
                    shape: BoxShape.circle,
                  ),
                ),
                FitText.body(rule.key, maxLines: 2),
              ],
            ),
          ),
      ],
    );
  }
}
