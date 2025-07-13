import 'package:flutter/material.dart';
import 'package:flutter_fit_utils_ui/flutter_fit_utils_ui.dart';

enum LoadingRenderPosition {
  top,
  bottom,
}

/// Widget that can change the loading state of it's child.
class FitLoadingHandler extends StatefulWidget {
  /// Set to [true] if the child is loading and a loading indicator should be displayed.
  /// When loading, the opacity of the child will be reduced according to [FitLoadingHandlerBehavior.loadingOpacity].
  /// The pointers will also be absorbed when loading.
  final bool loading;

  /// Widget to display to indicate to the user that [child] is loading.
  /// If [null], the displayed widget will be a [FitLoadingIndicator].
  final Widget loadingIndicator;

  final LoadingRenderPosition renderPosition;

  /// Child widget.
  final Widget child;

  /// Overrides the behavior inside [FitTheme].
  final FitLoadingHandlerBehavior? behavior;

  /// Creates a new [FitLoadingHandler].
  const FitLoadingHandler({
    super.key,
    required this.loading,
    required this.child,
    this.loadingIndicator = const FitLoadingIndicator(),
    this.renderPosition = LoadingRenderPosition.bottom,
    this.behavior,
  });

  @override
  State<FitLoadingHandler> createState() => _FitLoadingHandlerState();
}

class _FitLoadingHandlerState extends State<FitLoadingHandler> {
  @override
  Widget build(BuildContext context) {
    final FitTheme? fitTheme = FitTheme.maybeOf(context);
    final FitLoadingHandlerBehavior finalBehavior = widget.behavior ??
        fitTheme?.loadingBehavior ??
        const FitLoadingHandlerBehavior();

    return Stack(
      alignment: Alignment.center,
      children: [
        if (widget.loading && widget.renderPosition == LoadingRenderPosition.bottom)
          widget.loadingIndicator,
        AnimatedOpacity(
          opacity: widget.loading ? finalBehavior.loadingOpacity : 1,
          duration: finalBehavior.transitionDuration,
          child: AbsorbPointer(
            absorbing: widget.loading,
            child: widget.child,
          ),
        ),
        if (widget.loading && widget.renderPosition == LoadingRenderPosition.top)
          widget.loadingIndicator,
      ],
    );
  }
}
