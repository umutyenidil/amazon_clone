import 'package:flutter/material.dart';

class AppPadding {
  AppPadding._();

  static final AppPadding instance = AppPadding._();

  final EdgeInsetsGeometry t4 = const EdgeInsets.only(top: 4.0);
  final EdgeInsetsGeometry t8 = const EdgeInsets.only(top: 8.0);
  final EdgeInsetsGeometry t16 = const EdgeInsets.only(top: 16.0);

  final EdgeInsetsGeometry b8 = const EdgeInsets.only(bottom: 8.0);
  final EdgeInsetsGeometry b16 = const EdgeInsets.only(bottom: 16.0);

  final EdgeInsetsGeometry l8 = const EdgeInsets.only(left: 8.0);
  final EdgeInsetsGeometry l16 = const EdgeInsets.only(left: 16.0);

  final EdgeInsetsGeometry r8 = const EdgeInsets.only(right: 8.0);
  final EdgeInsetsGeometry r16 = const EdgeInsets.only(right: 16.0);


  final EdgeInsetsGeometry h4 = const EdgeInsets.symmetric(horizontal: 4.0);
  final EdgeInsetsGeometry h8 = const EdgeInsets.symmetric(horizontal: 8.0);
  final EdgeInsetsGeometry h16 = const EdgeInsets.symmetric(horizontal: 16.0);
  final EdgeInsetsGeometry h32 = const EdgeInsets.symmetric(horizontal: 32.0);

  final EdgeInsetsGeometry v4 = const EdgeInsets.symmetric(vertical: 4.0);
  final EdgeInsetsGeometry v8 = const EdgeInsets.symmetric(vertical: 8.0);
  final EdgeInsetsGeometry v16 = const EdgeInsets.symmetric(vertical: 16.0);
  final EdgeInsetsGeometry v32 = const EdgeInsets.symmetric(vertical: 32.0);


  final EdgeInsetsGeometry all8 = const EdgeInsets.all(8.0);
  final EdgeInsetsGeometry all16 = const EdgeInsets.all(16.0);
}
