import 'package:amazon_clone/product/app_config/app_initializer.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await initApp();

  runApp(const AppInitializer());
}
