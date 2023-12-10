import 'package:amazon_clone/core/extensions/build_context_extensions/build_context_extensions.dart';
import 'package:amazon_clone/product/app_assets/lottie_animations/lottie_animations.dart';
import 'package:amazon_clone/product/app_config/app_config.dart';
import 'package:amazon_clone/product/cache/shared_preferences/shared_preferences_manager.dart';
import 'package:amazon_clone/product/providers/auth_provider.dart';
import 'package:amazon_clone/product/router/on_generate_route_mixin.dart';
import 'package:amazon_clone/product/services/auth_service/auth_service.dart';
import 'package:amazon_clone/product/services/user_service/user_service.dart';
import 'package:amazon_clone/product/themes/app_theme.dart';
import 'package:amazon_clone/product/views/pages/admin_main_page/admin_main_page.dart';
import 'package:amazon_clone/product/views/pages/main_page/main_page.dart';
import 'package:amazon_clone/product/views/pages/sign_in_page/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget with OnGenerateRouteMixin {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConfig.instance.appTitle,
      theme: AppTheme.instance.lightTheme,
      onGenerateRoute: onGenerateRoute,
      home: FutureBuilder<UserServiceResponse>(
        future: authentication(context),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              if (snapshot.hasData) {
                if (snapshot.data!.status == UserServiceResponseStatus.successful) {
                  if (snapshot.data!.user!.type == 'user') {
                    return const MainPage();
                  } else {
                    return const AdminMainPage();
                  }
                }
              }
              return const SignInPage();

            default:
              return Scaffold(
                body: Center(
                  child: LottieAnimations.shopping_loader.toAnimation(size: context.screenWidth * 0.5),
                ),
              );
          }
        },
      ),
    );
  }

  Future<UserServiceResponse> authentication(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));

    await SharedPreferencesManager.instance.init();
    String? token = await SharedPreferencesManager.instance.getString(SharedPreferencesKeys.xAuthToken);

    if (token != null) {
      UserServiceResponse userServiceResponse = await UserService.instance.getUserData(token);

      if (userServiceResponse.status == UserServiceResponseStatus.successful) {
        if (context.mounted) {
          Provider.of<AuthProvider>(context, listen: false).setCurrentUser(userServiceResponse.user!);
        }
      } else {
        await SharedPreferencesManager.instance.removeItem(SharedPreferencesKeys.xAuthToken);
      }

      return userServiceResponse;
    }

    return UserServiceResponse(status: UserServiceResponseStatus.failed);
  }
}
