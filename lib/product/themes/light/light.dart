import 'package:amazon_clone/product/constants/app_color.dart';
import 'package:flutter/material.dart';

part '_app_bar_theme.dart';

part '_app_bar_icon_theme.dart';

part '_color_scheme.dart';

final ThemeData light = ThemeData.light().copyWith(
  useMaterial3: false,
  scaffoldBackgroundColor: AppColor.instance.white,
  appBarTheme: _appBarTheme,
  colorScheme: _colorScheme,
);
