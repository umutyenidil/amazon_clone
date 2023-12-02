import 'package:amazon_clone/product/constants/app_border_radius.dart';
import 'package:amazon_clone/product/constants/app_padding.dart';
import 'package:amazon_clone/product/router/app_router.dart';
import 'package:amazon_clone/product/views/common_widgets/secure_text_input_field.dart';
import 'package:amazon_clone/product/views/common_widgets/text_input_field.dart';
import 'package:amazon_clone/product/views/pages/sign_in_page/sign_in_page.dart';
import 'package:flutter/material.dart';

part '_sign_up_page_manager.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends _SignUpPageManager {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Form(
              child: Padding(
                padding: AppPadding.instance.all16,
                child: Column(
                  children: [
                    Padding(
                      padding: AppPadding.instance.b16,
                      child: TextInputField(
                        controller: _nameController,
                        hintText: 'Your name',
                        inputType: TextInputType.name,
                      ),
                    ),
                    Padding(
                      padding: AppPadding.instance.b16,
                      child: TextInputField(
                        controller: _emailAddressController,
                        hintText: 'Your email address',
                        inputType: TextInputType.emailAddress,
                      ),
                    ),
                    Padding(
                      padding: AppPadding.instance.b16,
                      child: SecureTextInputField(
                        controller: _passwordController,
                        hintText: 'Your password',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: _submitForm,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: AppBorderRadius.instance.all16,
                        ),
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: const Text('Sign up'),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account?"),
                        TextButton(
                          onPressed: _routeSignInPage,
                          child: const Text('Sign in'),
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
      title: const Text('Sign up'),
      centerTitle: true,
    );
  }
}
