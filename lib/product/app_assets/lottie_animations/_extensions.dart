part of 'lottie_animations.dart';

extension LottieAnimationPaths on LottieAnimations {
  String get path {
    return 'assets/animations/lottie/$name.json';
  }

  Widget toAnimation({
    Animation<double>? animation,
    double size = 64,
    double? height,
    double? width,
    bool repeat = false,
    BoxFit? fit,
  }) {
    if (size != 64 && height != null && width != null) {
      throw LottieSizingException;
    }

    /// todo: set FrameRate for each lottie
    switch (this) {
      case LottieAnimations.shopping_loader:
        return LottieBuilder.asset(
          path,
          frameRate: FrameRate(234),
          height: height ?? size,
          width: width ?? size,
          controller: animation,
          repeat: repeat,
          fit: fit,
          filterQuality: FilterQuality.low,
        );

      default:
        throw LottieNotFoundException;
    }
  }
}
