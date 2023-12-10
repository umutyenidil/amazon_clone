import 'package:amazon_clone/core/extensions/build_context_extensions/build_context_extensions.dart';
import 'package:amazon_clone/product/app_assets/svg_icons.dart';
import 'package:amazon_clone/product/constants/app_border_radius.dart';
import 'package:amazon_clone/product/constants/app_color.dart';
import 'package:amazon_clone/product/constants/app_padding.dart';
import 'package:amazon_clone/product/models/user_model.dart';
import 'package:amazon_clone/product/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

part '_admin_home_page_manager.dart';

part 'widgets/_app_bar.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends _AdminHomePageManager {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: _AppBar(),
    );
  }
}

