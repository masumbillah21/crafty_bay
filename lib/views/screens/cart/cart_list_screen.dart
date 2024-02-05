import 'package:crafty_bay/controllers/cart/get_cart_list_controller.dart';
import 'package:crafty_bay/controllers/home/bottom_nav_controller.dart';
import 'package:crafty_bay/utilities/app_colors.dart';
import 'package:crafty_bay/utilities/app_messages.dart';
import 'package:crafty_bay/views/screens/checkout/checkout_screen.dart';
import 'package:crafty_bay/views/widgets/bottom_section_bg.dart';
import 'package:crafty_bay/views/widgets/cart/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartListScreen extends StatelessWidget {
  static const routeName = '/cart';
  const CartListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<GetCartListController>().getCartList();
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
        body: GetBuilder<GetCartListController>(
            init: Get.find<GetCartListController>(),
            builder: (cart) {
              return Visibility(
                visible: !cart.inProgress,
                replacement: const Center(
                  child: CircularProgressIndicator(),
                ),
                child: cart.cartList?.cartList?.isNotEmpty ?? false
                    ? Column(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: cart.cartList?.cartList?.length ?? 0,
                                itemBuilder: (context, index) => CartItem(
                                  cartModel: cart.cartList!.cartList![index],
                                  controller: cart,
                                ),
                              ),
                            ),
                          ),
                          BottomSectionBg(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Total Price",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Obx(
                                      () => Text(
                                        "\$${cart.totalPrice}",
                                        style: const TextStyle(
                                          color: AppColors.primaryColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 100,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Get.toNamed(CheckoutScreen.routeName);
                                    },
                                    child: const Text("Checkout"),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    : Center(
                        child: Text(
                          AppMessages.emptyMessage("Cart"),
                        ),
                      ),
              );
            }),
      ),
    );
  }
}
