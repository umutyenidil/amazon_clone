part of 'build_context_extensions.dart';

extension ThemeExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colorCheme => Theme.of(this).colorScheme;

  ElevatedButtonThemeData get elevatedButtonTheme => Theme.of(this).elevatedButtonTheme;
}
