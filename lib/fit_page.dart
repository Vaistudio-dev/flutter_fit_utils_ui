import 'package:flutter/material.dart';
import 'package:flutter_fit_utils_ui/fit_theme.dart';

/// Widget that wraps it's children into a basic page widget tree.
/// A scrollable page, that can contain multiple widgets.
/// Also applies [FitTheme.pageMargin].
class FitPage extends StatelessWidget {
  /// Appbar of the page. Optionnal.
  final AppBar? appBar;

  /// Floating action button of the page. Optionnal.
  final Widget? floatingActionButton;

  /// Floating action button location.
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  /// Page content.
  final List<Widget> children;

  /// Scroll physics for the page.
  final ScrollPhysics? scrollPhysics;

  /// Alignment for the page content.
  final Alignment? alignment;

  /// Cross axis alignment for the page content.
  final CrossAxisAlignment crossAxisAlignment;

  /// Main axis alignment for the page content.
  final MainAxisAlignment mainAxisAlignment;

  /// If set, the content will be wrapped with a [RefreshIndicator].
  final Future<void> Function()? onRefresh;

  const FitPage(
      {super.key,
      this.appBar,
      required this.children,
      this.scrollPhysics,
      this.floatingActionButton,
      this.floatingActionButtonLocation,
      this.onRefresh,
      this.crossAxisAlignment = CrossAxisAlignment.start,
      this.mainAxisAlignment = MainAxisAlignment.start,
      this.alignment});

  @override
  Widget build(BuildContext context) {
    final base = Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: Container(
          alignment: alignment,
          margin: FitTheme.maybeOf(context)?.pageMargin,
          child: SingleChildScrollView(
            physics: scrollPhysics,
            child: Column(
              mainAxisAlignment: mainAxisAlignment,
              crossAxisAlignment: crossAxisAlignment,
              children: children,
            ),
          ),
        ),
      ),
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
    );

    if (onRefresh != null) {
      return RefreshIndicator(
        onRefresh: onRefresh!,
        child: base,
      );
    }

    return base;
  }
}
