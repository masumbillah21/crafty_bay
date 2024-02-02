import 'package:crafty_bay/controllers/bottom_nav_controller.dart';
import 'package:crafty_bay/controllers/read_cart_list_controller.dart';
import 'package:crafty_bay/utilities/app_messages.dart';
import 'package:crafty_bay/views/widgets/cart_item.dart';
import 'package:crafty_bay/views/widgets/fixed_bottom_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartListScreen extends StatelessWidget {
  static const routeName = '/cart';
  const CartListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<ReadCartListController>().getCartList();
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
        body: GetBuilder<ReadCartListController>(builder: (cart) {
          return Visibility(
            visible: !cart.inProgress,
            replacement: const Center(
              child: CircularProgressIndicator(),
            ),
            child: cart.cartList?.isNotEmpty ?? false
                ? Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: cart.cartList?.length ?? 0,
                            itemBuilder: (context, index) => CartItem(
                              cartModel: cart.cartList![index],
                            ),
                          ),
                        ),
                      ),
                      const FixedBottomSection()
                    ],
                  )
                : Text(
                    AppMessages.emptyMessage("Cart"),
                  ),
          );
        }),
      ),
    );
  }
}
