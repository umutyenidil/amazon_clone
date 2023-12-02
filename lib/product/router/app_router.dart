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
