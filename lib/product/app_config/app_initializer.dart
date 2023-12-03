import 'package:amazon_clone/product/app_config/app.dart';
import 'package:amazon_clone/product/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppInitializer extends StatelessWidget {
  const AppInitializer({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => AuthProvider()),
      ],
      child: const App(),
    );
  }
}

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
}
