import 'package:flutter/material.dart';
import 'package:flutter_fit_utils_ui/fit_theme.dart';

/// Widget that wraps it's children into a basic page widget tree.
/// A scrollable page, that can contain multiple widgets.
/// Also applies [FitTheme.pageMargin].
class FitPage extends StatelessWidget {
  /// Appbar of the page. Optionnal.
  final AppBar? appBar;

  /// Page content.
  final List<Widget> children;

  /// Set to [false] if you don't want your page content to be scrollable.
  /// [true] by default.
  final bool scrollable;

  const FitPage(
      {super.key, this.appBar, required this.children, this.scrollable = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: !scrollable ? const NeverScrollableScrollPhysics() : null,
          child: Container(
            margin: FitTheme.of(context)?.pageMargin,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}
