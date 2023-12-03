import 'package:amazon_clone/product/models/user_model.dart';
import 'package:amazon_clone/product/providers/auth_provider.dart';
import 'package:amazon_clone/product/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

part '_main_page_manager.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends _MainPageManager {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentUser!.emailAddress),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Main Page'),
            ElevatedButton(
              onPressed: () {},
              child: const Text('test'),
            ),
          ],
        ),
      ),
    );
  }
}
