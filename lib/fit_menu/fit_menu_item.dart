import 'package:flutter/material.dart';

/// Item for a [FitMenu].
@immutable
class FitMenuItem {
  /// Id of the item.
  final String? id;

  /// Icon data of the item.
  final IconData icon;

  /// Text of the item.
  final String title;

  /// Execute when tapping on the item.
  final Function(BuildContext context, Object? item) onTap;

  /// Execute when checking if the item should be displayed or not.
  /// Should return [true] if the item has to be shown.
  final bool Function(BuildContext context, Object? item) show;

  /// Execute when checking if the item should be disabled or not.
  /// Should return [true] if the item has to be disabled;
  final bool Function(BuildContext context, Object? item) disable;

  /// Creates a new [FitMenuItem].
  const FitMenuItem({
    this.id,
    required this.icon,
    required this.title,
    required this.onTap,
    this.show = _accept,
    this.disable = _refuse,
  });

  static bool _accept(_, __) => true;
  static bool _refuse(_, __) => false;

  /// Copies an instance and override properties.
  FitMenuItem copyWith(
          {String? id,
          IconData? icon,
          String? title,
          Function(BuildContext context, Object? item)? onTap,
          bool Function(BuildContext context, Object? item)? show,
          bool Function(BuildContext context, Object? item)? disable}) =>
      FitMenuItem(
        id: id ?? this.id,
        icon: icon ?? this.icon,
        title: title ?? this.title,
        onTap: onTap ?? this.onTap,
        show: show ?? this.show,
        disable: disable ?? this.disable,
      );
}
