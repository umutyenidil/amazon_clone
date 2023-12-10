import 'package:amazon_clone/product/views/pages/admin_analytics_page/admin_analytics_page.dart';
import 'package:amazon_clone/product/views/pages/admin_home_page/admin_home_page.dart';
import 'package:amazon_clone/product/views/pages/admin_main_page/admin_main_page.dart';
import 'package:amazon_clone/product/views/pages/admin_orders_page/admin_orders_page.dart';
import 'package:amazon_clone/product/views/pages/cart_page/cart_page.dart';
import 'package:amazon_clone/product/views/pages/default_page/default_page.dart';
import 'package:amazon_clone/product/views/pages/home_page/home_page.dart';
import 'package:amazon_clone/product/views/pages/main_page/main_page.dart';
import 'package:amazon_clone/product/views/pages/profile_page/profile_page.dart';
import 'package:amazon_clone/product/views/pages/sign_in_page/sign_in_page.dart';
import 'package:amazon_clone/product/views/pages/sign_up_page/sign_up_page.dart';
import 'package:flutter/material.dart';

part 'routing_enums.dart';
part 'routing_enum_extensions.dart';

class AppRouter {
  final BuildContext context;

  AppRouter._(this.context);

  factory AppRouter.of(BuildContext context) {
    return AppRouter._(context);
  }

  void route(Routes route, {RoutingMethods routingMethod = RoutingMethods.push, Map<String, dynamic>? arguments}) {
    switch (routingMethod) {
      case RoutingMethods.popAndPush:
        Navigator.of(context).popAndPushNamed(route.path, arguments: arguments);
      case RoutingMethods.pushReplacement:
        Navigator.of(context).pushReplacementNamed(route.path, arguments: arguments);
      case RoutingMethods.pushAndRemoveEverything:
        Navigator.of(context).pushNamedAndRemoveUntil(route.path, arguments: arguments, (route) => false);
      case RoutingMethods.push:
      default:
        Navigator.of(context).pushNamed(route.path, arguments: arguments);
    }
  }
}
