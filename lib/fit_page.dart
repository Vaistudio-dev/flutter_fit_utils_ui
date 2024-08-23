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

  /// Page content.
  final List<Widget> children;

  /// Set to [false] if you don't want your page content to be scrollable.
  /// [true] by default.
  final bool scrollable;

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
      this.scrollable = true,
      this.floatingActionButton,
      this.onRefresh,
      this.crossAxisAlignment = CrossAxisAlignment.start,
      this.mainAxisAlignment = MainAxisAlignment.start,
      this.alignment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          final child = SingleChildScrollView(
            physics: !scrollable
                ? const NeverScrollableScrollPhysics()
                : onRefresh != null
                    ? const AlwaysScrollableScrollPhysics()
                    : null,
            child: Container(
              height: constraints.maxHeight,
              margin: FitTheme.of(context)?.pageMargin,
              alignment: alignment,
              child: Column(
                crossAxisAlignment: crossAxisAlignment,
                mainAxisAlignment: mainAxisAlignment,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ...children,
                  const Spacer(),
                ],
              ),
            ),
          );

          if (onRefresh != null) {
            return RefreshIndicator(
              onRefresh: onRefresh!,
              child: child,
            );
          }

          return child;
        }),
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}
