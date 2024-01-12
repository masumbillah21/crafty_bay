import 'package:crafty_bay/controllers/bottom_nav_controller.dart';
import 'package:crafty_bay/views/widgets/cart_item.dart';
import 'package:crafty_bay/views/widgets/fixed_bottom_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        Get.find<BottomNavController>().backToHome();
      },
      child: Scaffold(
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
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 15,
                  itemBuilder: (context, index) => const CartItem(),
                ),
              ),
            ),
            const FixedBottomSection()
          ],
        ),
      ),
    );
  }
}
