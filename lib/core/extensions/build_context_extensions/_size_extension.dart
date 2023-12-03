part of 'build_context_extensions.dart';

extension SizeExtension on BuildContext {
  double get screenWidth {
    return MediaQuery.of(this).size.width;
  }

  double get screenHeight {
    return MediaQuery.of(this).size.height;
  }

  double get statusBarHeight {
    return MediaQuery.of(this).viewPadding.top;
  }
}
