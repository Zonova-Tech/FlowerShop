import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Card(
        child: ListTile(
          title: const Text('Customized Bouquet x1'),
          subtitle: const Text('Edit/remove supported in cart module'),
          trailing: FilledButton(onPressed: () {}, child: const Text('Checkout')),
        ),
      ),
    );
  }
}
