import 'package:amazon_clone/product/cache/shared_preferences/shared_preferences_manager.dart';
import 'package:amazon_clone/product/constants/app_padding.dart';
import 'package:amazon_clone/product/models/sign_in_form_model.dart';
import 'package:amazon_clone/product/providers/auth_provider.dart';
import 'package:amazon_clone/product/router/app_router.dart';
import 'package:amazon_clone/product/services/auth_service/auth_service.dart';
import 'package:amazon_clone/product/utilities/snack_bar_helper.dart';
import 'package:amazon_clone/product/views/common_widgets/secure_text_input_field.dart';
import 'package:amazon_clone/product/views/common_widgets/text_input_field.dart';
import 'package:amazon_clone/product/views/pages/default_page/form_submit_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

part '_sign_in_page_manager.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends _SignInPageManager {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Form(
              key: _formKey,
              child: Padding(
                padding: AppPadding.instance.all16,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: AppPadding.instance.b16,
                      child: TextInputField(
                        controller: _emailAddressController,
                        hintText: _emailAddressFieldHint,
                        inputType: TextInputType.emailAddress,
                        validator: _emailFieldValidator,
                      ),
                    ),
                    Padding(
                      padding: AppPadding.instance.b16,
                      child: SecureTextInputField(
                        controller: _passwordController,
                        hintText: _passwordFieldHint,
                        validator: _passwordFieldValidator,
                      ),
                    ),
                    FormSubmitButton(
                      onPressed: _submitForm,
                      child: Text(_submitButtonText),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(_signUpHintText),
                        TextButton(
                          onPressed: _routeSignUpPage,
                          child: Text(_signUpButtonText),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text(_appTitleText),
      centerTitle: true,
    );
  }
}
