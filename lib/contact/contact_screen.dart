import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  static const routeName = '/contact';
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact'),
      ),
      body: const Center(
        child: Text('Coming Soon'),
      ),
    );
  }
}
