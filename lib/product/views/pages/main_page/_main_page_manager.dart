part of 'main_page.dart';

abstract class _MainPageManager extends State<MainPage> {
  late final UserModel? _currentUser;

  @override
  void initState() {
    super.initState();

    _currentUser = Provider.of<AuthProvider>(context, listen: false).getCurrentUser();

    if (_currentUser == null) {
      AppRouter.of(context).route(Routes.sign_in_page);
    }
  }
}
