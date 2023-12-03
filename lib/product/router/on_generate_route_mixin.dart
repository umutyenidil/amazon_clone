import 'package:amazon_clone/product/app_config/app.dart';
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
        return _materialPageRoute(const SignInPage());
      case Routes.sign_up_page:
        return _materialPageRoute(const SignUpPage());
      case Routes.main_page:
        return _materialPageRoute(const MainPage());
      case Routes.default_page:
      default:
        return _materialPageRoute(const DefaultPage());
    }
  }

  MaterialPageRoute _materialPageRoute(Widget page) {
    return MaterialPageRoute(builder: (BuildContext context) => page);
  }
}
