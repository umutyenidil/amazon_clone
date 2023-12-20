part of 'admin_home_page.dart';

abstract class _AdminHomePageManager extends State<AdminHomePage> {
  @override
  void initState() {
    super.initState();

  }


  void _floatingActionButtonAction() {
    AppRouter.of(context).route(
      Routes.admin_add_product_page,
      routingMethod: RoutingMethods.pushReplacement,
    );
  }
}
