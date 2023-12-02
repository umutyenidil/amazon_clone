part of 'sign_up_page.dart';

abstract class _SignUpPageManager extends State<SignUpPage> {
  late final GlobalKey<FormState> _formKey;

  late final TextEditingController _nameController;
  late final String _nameFieldHint;

  late final TextEditingController _emailAddressController;
  late final String _emailAddressFieldHint;

  late final TextEditingController _passwordController;
  late final String _passwordFieldHint;

  late final String _submitButtonText;
  late final String _signInHintText;
  late final String _signInButtonText;
  late final String _appTitleText;

  @override
  void initState() {
    super.initState();

    _formKey = GlobalKey<FormState>();

    _nameController = TextEditingController();
    _nameFieldHint = 'Your name';

    _emailAddressController = TextEditingController();
    _emailAddressFieldHint = 'Your email address';

    _passwordController = TextEditingController();
    _passwordFieldHint = 'Your password';

    _submitButtonText = 'Sign up';
    _signInHintText = "Already have an account?";
    _signInButtonText = 'Sign in';
    _appTitleText = 'Sign up';
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
