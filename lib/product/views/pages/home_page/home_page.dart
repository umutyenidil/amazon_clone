import 'dart:async';

import 'package:amazon_clone/core/extensions/build_context_extensions/build_context_extensions.dart';
import 'package:amazon_clone/product/app_assets/svg_icons.dart';
import 'package:amazon_clone/product/app_config/app.dart';
import 'package:amazon_clone/product/constants/app_border_radius.dart';
import 'package:amazon_clone/product/constants/app_color.dart';
import 'package:amazon_clone/product/constants/app_padding.dart';
import 'package:amazon_clone/product/models/user_model.dart';
import 'package:amazon_clone/product/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:collection/collection.dart';

part '_home_page_manager.dart';

part 'widgets/_app_bar.dart';

part 'widgets/_category_list.dart';

part 'widgets/_slider.dart';

part 'widgets/_offer_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends _HomePageManager {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: AppPadding.instance.v16,
              child: const _CategoryList(),
            ),
            Padding(
              padding: AppPadding.instance.b16,
              child: const _Slider(),
            ),
            Padding(
              padding: AppPadding.instance.b16.add(AppPadding.instance.h16),
              child: const _OfferList(),
            )
          ],
        ),
      ),
    );
  }
}
