// ignore_for_file: constant_identifier_names

part of 'app_router.dart';

enum Routes {
  default_page,
  sign_in_page,
  sign_up_page,
  main_page,
  home_page,
  cart_page,
  profile_page,
  admin_main_page,
  admin_home_page,
  admin_analytics_page,
  admin_orders_page,
  admin_add_product_page,
}

enum RoutingMethods {
  push,
  popAndPush,
  pushAndRemoveEverything,
  pushReplacement,
}
