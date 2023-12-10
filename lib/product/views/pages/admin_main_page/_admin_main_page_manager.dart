part of 'admin_main_page.dart';

abstract class _AdminMainPageManager extends State<AdminMainPage> {
  late int _currentPageIndex;
  late final List<Routes> _pages;

  @override
  void initState() {
    super.initState();

    _currentPageIndex = 0;

    _pages = <Routes>[
      Routes.admin_home_page,
      Routes.admin_analytics_page,
      Routes.admin_orders_page,
    ];
  }
}
