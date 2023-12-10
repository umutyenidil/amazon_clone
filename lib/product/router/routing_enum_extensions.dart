part of 'app_router.dart';

extension RoutingExtensiton on Routes {
  String get path => '/$name';

  Widget get page {
    switch (this) {
      case Routes.sign_in_page:
        return const SignInPage();
      case Routes.sign_up_page:
        return const SignUpPage();
      case Routes.main_page:
        return const MainPage();
      case Routes.home_page:
        return const HomePage();
      case Routes.cart_page:
        return const CartPage();
      case Routes.profile_page:
        return const ProfilePage();
      case Routes.admin_main_page:
        return const AdminMainPage();
      case Routes.admin_home_page:
        return const AdminHomePage();
      case Routes.admin_analytics_page:
        return const AdminAnalyticsPage();
      case Routes.admin_orders_page:
        return const AdminOrdersPage();
      case Routes.default_page:
      default:
        return const DefaultPage();
    }
  }
}
