import 'package:amazon_clone/product/app_config/app.dart';
import 'package:amazon_clone/product/views/pages/admin_home_page/admin_home_page.dart';
import 'package:amazon_clone/product/views/pages/admin_main_page/admin_main_page.dart';
import 'package:amazon_clone/product/views/pages/default_page/default_page.dart';
import 'package:amazon_clone/product/views/pages/main_page/main_page.dart';
import 'package:amazon_clone/product/views/pages/sign_in_page/sign_in_page.dart';
import 'package:amazon_clone/product/views/pages/sign_up_page/sign_up_page.dart';
import 'package:flutter/material.dart';

import 'app_router.dart';

mixin OnGenerateRouteMixin<T extends App> {
  Route? onGenerateRoute(RouteSettings settings) {
    String? routeName = settings.name;
    Map<String, dynamic>? routeArgs = (settings.arguments as Map<String, dynamic>?);

    if (routeName == null) {
      return _materialPageRoute(const DefaultPage());
    }

    if (routeName == '/') {
      return null;
    }

    Routes route = Routes.values.byName(routeName.replaceFirst('/', ''));

    switch (route) {
      case Routes.sign_in_page:
        return _materialPageRoute(Routes.sign_in_page.page);
      case Routes.sign_up_page:
        return _materialPageRoute(Routes.sign_up_page.page);
      case Routes.main_page:
        return _materialPageRoute(Routes.main_page.page);
      case Routes.admin_main_page:
        return _materialPageRoute(Routes.admin_main_page.page);
      case Routes.admin_home_page:
        return _materialPageRoute(Routes.admin_home_page.page);
      case Routes.admin_analytics_page:
        return _materialPageRoute(Routes.admin_analytics_page.page);
      case Routes.admin_orders_page:
        return _materialPageRoute(Routes.admin_orders_page.page);
      case Routes.default_page:
      default:
        return _materialPageRoute(Routes.default_page.page);
    }
  }

  MaterialPageRoute _materialPageRoute(Widget page) {
    return MaterialPageRoute(builder: (BuildContext context) => page);
  }
}
