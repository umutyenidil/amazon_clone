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

  Future<void> _submitForm() async {
    // formun validate olup olmadigini kontrol et
    bool isFormValidate = _formKey.currentState?.validate() ?? false;

    if (isFormValidate) {
      // girilen verileri al
      SignUpFormModel formData = SignUpFormModel(
        name: _nameController.text,
        emailAddress: _emailAddressController.text,
        password: _passwordController.text,
      );

      // sign up islemini yapmaya calis
      AuthServiceResponse response = await AuthService.instance.signUp(formData);

      // sign up islemi sonucuna gore snackbar goster
      if (context.mounted) {
        SnackbarHelper.of(context).clearSnackBars();
        switch (response.status) {
          case AuthServiceResponseStatus.successful:
            SnackbarHelper.of(context).showSnackBar('User has been created');
            break;
          case AuthServiceResponseStatus.failed:
            SnackbarHelper.of(context).showSnackBar(response.message!);
            break;
        }
      }
    }
  }

  void _routeSignInPage() {
    AppRouter.of(context).route(Routes.sign_in_page, routingMethod: RoutingMethods.pushReplacement);
  }

  // todo: validator methodlarini yonet
  String? _emailFieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email address field cannot be empty';
    }

    return null;
  }

  String? _nameFieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name field cannot be empty';
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
