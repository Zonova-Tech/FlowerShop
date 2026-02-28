import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Authentication', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 8),
              const Text('• Google Login'),
              const Text('• Email & Password Signup'),
              const Text('• Firebase Authentication'),
              const SizedBox(height: 16),
              FilledButton(onPressed: () {}, child: const Text('Continue with Google')),
              const SizedBox(height: 8),
              OutlinedButton(onPressed: () {}, child: const Text('Signup with Email')),
            ],
          ),
        ),
      ),
    );
  }
}
