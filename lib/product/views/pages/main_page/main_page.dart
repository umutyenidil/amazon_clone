import 'package:flutter/material.dart';

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
      appBar: AppBar(),
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
