import 'dart:async';

import 'package:amazon_clone/core/extensions/build_context_extensions/build_context_extensions.dart';
import 'package:amazon_clone/core/extensions/list_extensions/list_extensions.dart';
import 'package:amazon_clone/product/app_assets/svg_icons.dart';
import 'package:amazon_clone/product/app_config/app.dart';
import 'package:amazon_clone/product/constants/app_border_radius.dart';
import 'package:amazon_clone/product/constants/app_color.dart';
import 'package:amazon_clone/product/constants/app_padding.dart';
import 'package:flutter/material.dart';

part './widgets/_app_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _AppBar(),
      body: Padding(
        padding: AppPadding.instance.v16,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: AppPadding.instance.b16,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: AppPadding.instance.h16,
                child: Row(
                  children: [
                    Chip(
                      labelPadding: AppPadding.instance.h16.add(AppPadding.instance.v4),
                      label: const Text('Your Orders'),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Chip(
                      labelPadding: AppPadding.instance.h16.add(AppPadding.instance.v4),
                      label: const Text('Turn Seller'),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Chip(
                      labelPadding: AppPadding.instance.h16.add(AppPadding.instance.v4),
                      label: const Text('Log Out'),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Chip(
                      labelPadding: AppPadding.instance.h16.add(AppPadding.instance.v4),
                      label: const Text('Your Wish List'),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: AppPadding.instance.h16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Orders'),
                  TextButton(
                    onPressed: () {},
                    child: Text('See All'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: AppPadding.instance.h16,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  return Card(
                    color: AppColor.instance.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: AppBorderRadius.instance.all16,
                      side: BorderSide(
                        color: AppColor.instance.greenVogue,
                        width: 0.25,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
