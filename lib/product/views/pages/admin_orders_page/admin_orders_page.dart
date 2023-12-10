import 'package:flutter/material.dart';

part '_admin_orders_page_manager.dart';

class AdminOrdersPage extends StatefulWidget {
  const AdminOrdersPage({super.key});

  @override
  State<AdminOrdersPage> createState() => _AdminOrdersPageState();
}

class _AdminOrdersPageState extends _AdminOrdersPageManager {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('orders'),),
    );
  }
}
