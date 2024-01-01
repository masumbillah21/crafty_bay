import 'package:flutter/material.dart';

class WishListScreen extends StatelessWidget {
  static const routeName = '/wish-list';
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Wish List Screen'),
      ),
    );
  }
}
