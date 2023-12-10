import 'package:flutter/material.dart';

part '_admin_analytics_page_manager.dart';

class AdminAnalyticsPage extends StatefulWidget {
  const AdminAnalyticsPage({super.key});

  @override
  State<AdminAnalyticsPage> createState() => _AdminAnalyticsPageState();
}

class _AdminAnalyticsPageState extends _AdminAnalyticsPageManager {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('analytics'),
      ),
    );
  }
}
