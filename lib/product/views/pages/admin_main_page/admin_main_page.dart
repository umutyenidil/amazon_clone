import 'package:amazon_clone/product/app_assets/svg_icons.dart';
import 'package:amazon_clone/product/constants/app_color.dart';
import 'package:amazon_clone/product/constants/app_padding.dart';
import 'package:amazon_clone/product/models/user_model.dart';
import 'package:amazon_clone/product/providers/auth_provider.dart';
import 'package:amazon_clone/product/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

part '_admin_main_page_manager.dart';

part 'widgets/_bottom_navigation_bar.dart';

class AdminMainPage extends StatefulWidget {
  const AdminMainPage({super.key});

  @override
  State<AdminMainPage> createState() => _AdminMainPageState();
}

class _AdminMainPageState extends _AdminMainPageManager {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        body: _pages[_currentPageIndex].page,
        bottomNavigationBar: _BottomNavigationBar(
          pages: _pages,
          pageChangeCallback: (pageIndex) {
            setState(() {
              _currentPageIndex = pageIndex;
            });
          },
        ),
      ),
    );
  }
}
