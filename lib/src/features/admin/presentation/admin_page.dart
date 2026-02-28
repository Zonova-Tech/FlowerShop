import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Admin Panel (Seller)'),
              SizedBox(height: 8),
              Text('• Add flower/ribbon/wrapping inventory with image, price, stock'),
              Text('• View customer orders and update order status'),
            ],
          ),
        ),
      ),
    );
  }
}
