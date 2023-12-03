part of 'lottie_animations.dart';

class LottieSizingException implements Exception {
  @override
  String toString() {
    return "You can't set the size property with width and height";
  }
}

class LottieNotFoundException implements Exception {
  @override
  String toString() {
    return "Lottie not found";
  }
}