import 'package:flutter/material.dart';
import 'package:flutter_fit_utils/flutter_fit_utils.dart';

import '../flutter_fit_utils_ui.dart';

/// Displays a [FitMenu].
void showFitMenu(BuildContext context, FitMenu menu) {
  showModalBottomSheet(
    context: context,
    builder: (context) => menu,
  );
}

/// Dynamic contextual menu.
class FitMenu extends StatelessWidget {
  static const double _defaultMenuHeight = 470;

  /// Item that activated the menu.
  final Modelable? tappedItem;

  /// Widget to be placed at the icon's position.
  final Widget? iconWidget;

  /// Icon data for the main icon.
  /// Will be colored to constrast with the background of the menu.
  final IconData? mainIcon;

  /// Title of the menu.
  final String title;

  /// Subtitle of the menu.
  final String? subTitle;

  /// Execute when tapping on a menu item.
  /// Use for analytics, etc.
  final Function()? onItemTap;

  /// Set to [false] if you don't want to pop the menu when an item is tapped.
  /// [true] by default.
  final bool popOnTap;

  /// List of the menu items.
  final List<FitMenuItem> menuItems;

  /// Height of the menu.
  /// Default: 470 px.
  final double height;

  /// Creates a new [FitMenu].
  const FitMenu({
    super.key,
    this.tappedItem,
    this.mainIcon,
    this.iconWidget,
    required this.title,
    this.subTitle,
    this.height = _defaultMenuHeight,
    this.onItemTap,
    required this.menuItems,
    this.popOnTap = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: FitTheme.of(context)?.baseRadius.copyWith(
            bottomRight: const Radius.circular(0),
            bottomLeft: const Radius.circular(0)),
      ),
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 12),
              Align(
                child: Container(
                  height: 4,
                  width: 32,
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary,
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                  ),
                ),
              ),
              ListTile(
                leading: mainIcon != null
                    ? Icon(mainIcon!,
                        color: Theme.of(context).colorScheme.onSecondary)
                    : iconWidget,
                title: FitText.title(
                  title,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary),
                ),
                subtitle: subTitle != null
                    ? FitText.body(
                        subTitle!,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onSecondary),
                      )
                    : null,
              ),
              const Divider(
                thickness: 0.25,
              ),
              for (final item in menuItems)
                if (item.show(context, tappedItem))
                  ListTile(
                    onTap: () {
                      if (onItemTap != null) {
                        onItemTap!();
                      }

                      if (popOnTap) {
                        Navigator.of(context).pop();
                      }

                      item.onTap(context, tappedItem);
                    },
                    leading: Icon(item.icon,
                        color: Theme.of(context).colorScheme.onSecondary),
                    title: FitText.title(
                      item.title,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary),
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
