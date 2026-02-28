import 'package:flutter/material.dart';

import '../../features/addresses/presentation/address_page.dart';
import '../../features/admin/presentation/admin_page.dart';
import '../../features/auth/presentation/auth_page.dart';
import '../../features/bouquet/presentation/bouquet_builder_page.dart';
import '../../features/cart/presentation/cart_page.dart';
import '../../features/orders/presentation/orders_page.dart';

class DashboardShell extends StatefulWidget {
  const DashboardShell({super.key});

  @override
  State<DashboardShell> createState() => _DashboardShellState();
}

class _DashboardShellState extends State<DashboardShell> {
  int _index = 0;

  final _pages = const [
    AuthPage(),
    BouquetBuilderPage(),
    CartPage(),
    AddressPage(),
    OrdersPage(),
    AdminPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Zonova Flowers')),
      body: Column(
        children: [
          Expanded(child: _pages[_index]),
          const _Footer(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (index) => setState(() => _index = index),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.login), label: 'Auth'),
          NavigationDestination(icon: Icon(Icons.local_florist), label: 'Bouquet'),
          NavigationDestination(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          NavigationDestination(icon: Icon(Icons.home), label: 'Address'),
          NavigationDestination(icon: Icon(Icons.receipt), label: 'Orders'),
          NavigationDestination(icon: Icon(Icons.admin_panel_settings), label: 'Admin'),
        ],
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      color: const Color(0xFFFBEAF2),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Zonova Flowers', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('Wariyapola, Sri Lanka'),
          Text('📞 071-613-2842'),
        ],
      ),
    );
  }
}
