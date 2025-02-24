import 'package:flutter/material.dart';

class FitMenuThemeData {
  final Color? textColor;
  final Color? iconColor;
  final Color? handleColor;
  final Color? backgroundColor;

  final double? dividerThickness;

  final double? disabledOpacity;

  const FitMenuThemeData({
    this.textColor,
    this.iconColor,
    this.handleColor,
    this.backgroundColor,
    this.dividerThickness,
    this.disabledOpacity,
  });
}