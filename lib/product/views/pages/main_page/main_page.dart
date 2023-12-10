import 'package:amazon_clone/product/app_assets/svg_icons.dart';
import 'package:amazon_clone/product/constants/app_color.dart';
import 'package:amazon_clone/product/constants/app_padding.dart';
import 'package:amazon_clone/product/models/user_model.dart';
import 'package:amazon_clone/product/providers/auth_provider.dart';
import 'package:amazon_clone/product/router/app_router.dart';
import 'package:amazon_clone/product/views/pages/admin_main_page/admin_main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

part '_main_page_manager.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends _MainPageManager {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        body: _pages[_currentPageIndex].page,
        bottomNavigationBar: _bottomNavigationBar(),
      ),
    );
  }

  IntrinsicHeight _bottomNavigationBar() {
    return IntrinsicHeight(
      child: Container(
        color: AppColor.instance.greenVogue,
        padding: AppPadding.instance.h32.add(AppPadding.instance.v4),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...List.generate(_pages.length, (index) {
                  return Visibility(
                    visible: index == _currentPageIndex,
                    child: Container(
                      width: SvgIconSizes.xl.toDouble(),
                      height: 4,
                      color: AppColor.instance.easternBlue,
                    ),
                  );
                }).toList(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _bottomNavigationBarItem(
                  icon: SvgIcons.home_2,
                  route: Routes.home_page,
                ),
                _badgedBottomNavigationBarItem(
                  badgeText: '1',
                  route: Routes.cart_page,
                  icon: SvgIcons.shopping_cart,
                ),
                _bottomNavigationBarItem(
                  route: Routes.profile_page,
                  icon: SvgIcons.profile_circle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomNavigationBarItem({
    required Routes route,
    required SvgIcons icon,
  }) {
    return InkWell(
      onTap: () {
        setState(() {
          _currentPageIndex = _pages.indexOf(route);
        });
      },
      child: icon.toWidget(
        color: _currentPageIndex == _pages.indexOf(route) ? AppColor.instance.easternBlue : AppColor.instance.cornflower,
        size: SvgIconSizes.xl,
      ),
    );
  }

  Widget _badgedBottomNavigationBarItem({
    required String badgeText,
    TextStyle? badgeStyle,
    Color backgroundColor = Colors.grey,
    Alignment badgeAlignment = Alignment.topRight,
    required Routes route,
    required SvgIcons icon,
  }) {
    return InkWell(
      onTap: () {
        setState(() {
          _currentPageIndex = _pages.indexOf(route);
        });
      },
      child: icon.toBadgedWidget(
        badgeText: badgeText,
        badgeStyle: badgeStyle,
        backgroundColor: backgroundColor,
        badgeAlignment: badgeAlignment,
        color: _currentPageIndex == _pages.indexOf(route) ? AppColor.instance.easternBlue : AppColor.instance.cornflower,
        size: SvgIconSizes.xl,
      ),
    );
  }
}
