import 'package:crafty_bay/controllers/bottom_nav_controller.dart';
import 'package:crafty_bay/utilities/app_messages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Get.find<BottomNavController>().backToHome();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('Cart'),
      ),
      body: Center(
        child: Text(
          AppMessages.emptyMessage("cart"),
        ),
      ),
    );
  }
}
