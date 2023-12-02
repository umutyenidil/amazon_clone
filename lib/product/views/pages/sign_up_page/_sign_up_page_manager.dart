part of 'sign_up_page.dart';

abstract class _SignUpPageManager extends State<SignUpPage> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailAddressController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController();
    _emailAddressController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailAddressController.dispose();
    _passwordController = TextEditingController();

    super.dispose();
  }

  void _submitForm() {}

  void _routeSignInPage() {
    AppRouter.of(context).route(Routes.sign_in_page, routingMethod: RoutingMethods.pushReplacement);
  }
}
