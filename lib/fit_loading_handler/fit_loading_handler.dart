import 'package:flutter/material.dart';
import 'package:flutter_fit_utils_ui/flutter_fit_utils_ui.dart';

/// Widget that can change the loading state of it's child.
class FitLoadingHandler extends StatefulWidget {
  /// Set to [true] if the child is loading and a loading indicator should be displayed.
  /// When loading, the opacity of the child will be reduced according to [FitLoadingHandlerBehavior.loadingOpacity].
  /// The pointers will also be absorbed when loading.
  final bool loading;

  /// Child widget.
  final Widget child;

  /// Overrides the behavior inside [FitTheme].
  final FitLoadingHandlerBehavior? behavior;

  /// Creates a new [FitLoadingHandler].
  const FitLoadingHandler({
    super.key,
    required this.loading,
    required this.child,
    this.behavior,
  });

  @override
  State<FitLoadingHandler> createState() => _FitLoadingHandlerState();
}

class _FitLoadingHandlerState extends State<FitLoadingHandler> {
  @override
  Widget build(BuildContext context) {
    final FitTheme? fitTheme = FitTheme.of(context);
    final FitLoadingHandlerBehavior finalBehavior = widget.behavior ??
        fitTheme?.loadingBehavior ??
        const FitLoadingHandlerBehavior();

    return Stack(
      children: [
        Visibility(
          visible: widget.loading,
          child: const FitLoadingIndicator(),
        ),
        AnimatedOpacity(
          opacity: widget.loading ? finalBehavior.loadingOpacity : 1,
          duration: finalBehavior.transitionDuration,
          child: AbsorbPointer(
            absorbing: widget.loading,
            child: widget.child,
          ),
        ),
      ],
    );
  }
}
