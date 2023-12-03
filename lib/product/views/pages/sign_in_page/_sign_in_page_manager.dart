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

  Future<void> _submitForm() async {
    // formun validate olup olmadigini kontrol et
    bool isFormValidate = _formKey.currentState?.validate() ?? false;

    if (isFormValidate) {
      // girilen verileri al
      SignInFormModel formData = SignInFormModel(
        emailAddress: _emailAddressController.text,
        password: _passwordController.text,
      );

      // sign up islemini yapmaya calis
      AuthServiceResponse response = await AuthService.instance.signIn(formData);

      // sign up islemi sonucuna gore snackbar goster
      if (context.mounted) {
        SnackbarHelper.of(context).clearSnackBars();
        switch (response.status) {
          case AuthServiceResponseStatus.successful:
            await SharedPreferencesManager.instance.init();

            await SharedPreferencesManager.instance.saveString(SharedPreferencesKeys.xAuthToken, response.user!.token!);

            if (context.mounted) {
              Provider.of<AuthProvider>(context, listen: false).setCurrentUser(response.user!);

              AppRouter.of(context).route(Routes.main_page, routingMethod: RoutingMethods.pushAndRemoveEverything);
            }

            break;
          case AuthServiceResponseStatus.failed:
            SnackbarHelper.of(context).showSnackBar(response.message!);
            break;
          case AuthServiceResponseStatus.authenticated:
            // TODO: Handle this case.
          case AuthServiceResponseStatus.notAuthenticated:
            // TODO: Handle this case.
        }
      }
    }
  }

  void _routeSignUpPage() {
    AppRouter.of(context).route(Routes.sign_up_page, routingMethod: RoutingMethods.pushReplacement);
  }

  // todo: validation'lari tek yerde topla
  String? _emailFieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email address field cannot be empty';
    }

    return null;
  }

  String? _passwordFieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password field cannot be empty';
    }

    return null;
  }
}
