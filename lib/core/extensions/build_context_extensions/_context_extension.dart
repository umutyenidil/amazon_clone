part of 'build_context_extensions.dart';

extension ContextExtension on BuildContext{
  bool get isKeyboardOpen {
    return MediaQuery
        .of(this)
        .viewInsets
        .bottom > 0;
  }
}