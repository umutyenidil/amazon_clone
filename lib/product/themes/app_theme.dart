import 'package:flutter/material.dart';
import './light/light.dart';

class AppTheme {
  AppTheme._privateConstructor();

  static final AppTheme _instance = AppTheme._privateConstructor();

  static AppTheme get instance => _instance;

  ThemeData lightTheme = light;
}
