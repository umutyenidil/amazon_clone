import 'package:amazon_clone/product/app_config/app_config.dart';
import 'package:amazon_clone/product/router/on_generate_route_mixin.dart';
import 'package:amazon_clone/product/themes/app_theme.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget with OnGenerateRouteMixin {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConfig.instance.appTitle,
      theme: AppTheme.instance.lightTheme,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
