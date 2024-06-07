import 'package:flutter/material.dart';

/// Spacing widget for spacing settings items.
class SettingSpacer extends StatelessWidget {
  static const double _defaultHeight = 30;
  static const double _smallHeight = 12;
  static const double _bigHeight = 48;

  /// Height of the spacer.
  final double height;

  /// Creates a new [SettingSpacer] with the default 30 pixels height.
  const SettingSpacer({super.key, this.height = _defaultHeight});

  /// Creates a new [SettingSpacer] with the default 30 pixels height.
  const SettingSpacer.regular({super.key, this.height = _defaultHeight});

  /// Creates a new [SettingSpacer] with a 12 pixels height.
  const SettingSpacer.small({super.key, this.height = _smallHeight});

  /// Creates a new [SettingSpacer] with a 48 pixels height.
  const SettingSpacer.big({super.key, this.height = _bigHeight});

  /// Creates a new [SettingSpacer] with a custom height.
  const SettingSpacer.custom({super.key, required this.height});

  /// Creates a new [SettingSpacer] with a 0 pixels height.
  const SettingSpacer.none({super.key, this.height = 0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}
