import 'package:flutter/material.dart';

class AppPadding {
  AppPadding._();

  static final AppPadding instance = AppPadding._();

  final EdgeInsetsGeometry b8 = const EdgeInsets.only(bottom: 8.0);
  final EdgeInsetsGeometry b16 = const EdgeInsets.only(bottom: 16.0);

  final EdgeInsetsGeometry r8 = const EdgeInsets.only(right: 8.0);
  final EdgeInsetsGeometry r16 = const EdgeInsets.only(right: 16.0);

  final EdgeInsetsGeometry h16 = const EdgeInsets.symmetric(horizontal: 16.0);

  final EdgeInsetsGeometry all8 = const EdgeInsets.all(8.0);
  final EdgeInsetsGeometry all16 = const EdgeInsets.all(16.0);
}
