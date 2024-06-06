/// Parameters of the behavior of a [FitLoadingHandler].
class FitLoadingHandlerBehavior {
  static const double _defaultLoadingOpacity = 0.3;
  static const Duration _defaultTransitionDuration = Duration(seconds: 1);

  /// Opacity of the child when the loading state is set to [true].
  final double loadingOpacity;

  /// Duration of the animation transition when toggling the loading state.
  final Duration transitionDuration;

  /// Creates a new [FitLoadingHandlerBehavior].
  const FitLoadingHandlerBehavior({
    this.loadingOpacity = _defaultLoadingOpacity,
    this.transitionDuration = _defaultTransitionDuration,
  });
}