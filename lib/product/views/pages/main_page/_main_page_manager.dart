part of 'main_page.dart';

abstract class _MainPageManager extends State<MainPage> {
  late int _currentPageIndex;
  late final List<Routes> _pages;

  @override
  void initState() {
    super.initState();

    _currentPageIndex = 0;

    _pages = <Routes>[
      Routes.home_page,
      Routes.cart_page,
      Routes.profile_page,
    ];
  }
}
