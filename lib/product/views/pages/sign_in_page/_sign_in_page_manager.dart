part of 'sign_in_page.dart';

abstract class _SignInPageManager extends State<SignInPage> {
  late final GlobalKey<FormState> _formKey;

  late final TextEditingController _emailAddressController;
  late final String _emailAddressFieldHint;

  late final TextEditingController _passwordController;
  late final String _passwordFieldHint;

  late final String _submitButtonText;
  late final String _signUpHintText;
  late final String _signUpButtonText;
  late final String _appTitleText;

  @override
  void initState() {
    super.initState();

    _formKey = GlobalKey<FormState>();

    _emailAddressController = TextEditingController();
    _emailAddressFieldHint = 'Your email address';

    _passwordController = TextEditingController();
    _passwordFieldHint = 'Your password';

    _submitButtonText = 'Sign in';
    _signUpHintText = "Don't have an account?";
    _signUpButtonText = 'Sign up';
    _appTitleText = 'Sign in';
  }

  @override
  void dispose() {
    _emailAddressController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  void _submitForm() {}

  void _routeSignUpPage() {
    AppRouter.of(context).route(Routes.sign_up_page, routingMethod: RoutingMethods.pushReplacement);
  }
}
