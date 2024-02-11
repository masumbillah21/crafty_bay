import 'package:crafty_bay/cart/controllers/get_cart_list_controller.dart';
import 'package:crafty_bay/cart/controllers/update_cart_controller.dart';
import 'package:crafty_bay/cart/widgets/cart_item.dart';
import 'package:crafty_bay/checkout/screens/checkout_screen.dart';
import 'package:crafty_bay/global/widgets/bottom_section_bg.dart';
import 'package:crafty_bay/home/controllers/bottom_nav_controller.dart';
import 'package:crafty_bay/utilities/app_colors.dart';
import 'package:crafty_bay/utilities/app_messages.dart';
import 'package:crafty_bay/utilities/utilities.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartListScreen extends StatelessWidget {
  static const routeName = '/cart';
  const CartListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<GetCartListController>().getCartList();
    });
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
          actions: [
            IconButton(
              enableFeedback: true,
              onPressed: () async {
                bool isChangedCart =
                    Get.find<GetCartListController>().productIdList.isNotEmpty;
                if (isChangedCart) {
                  bool res =
                      await Get.find<UpdateCartController>().updateCartList();
                  if (res) {
                    successToast(AppMessages.cartUpdateSuccess);
                  } else {
                    errorToast(AppMessages.cartUpdateFailed);
                  }
                } else {
                  errorToast(AppMessages.notingToUpdate);
                }
              },
              icon: GetBuilder<UpdateCartController>(builder: (updateCart) {
                return Visibility(
                  visible: !updateCart.inProgress,
                  replacement: const SizedBox(
                      height: 15,
                      width: 15,
                      child: CircularProgressIndicator()),
                  child: const Icon(
                    Icons.update_rounded,
                    color: AppColors.primaryColor,
                  ),
                );
              }),
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await Get.find<GetCartListController>().getCartList();
          },
          child: GetBuilder<GetCartListController>(builder: (cart) {
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
                        buildBottomSectionBg(cart, context)
                      ],
                    )
                  : Center(
                      child: Text(
                        AppMessages.emptyMessage("Cart item"),
                      ),
                    ),
            );
          }),
        ),
      ),
    );
  }

  BottomSectionBg buildBottomSectionBg(
      GetCartListController cart, BuildContext context) {
    return BottomSectionBg(
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
                  "৳${cart.totalPrice}",
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
                if (cart.productIdList.isEmpty) {
                  Get.toNamed(CheckoutScreen.routeName);
                } else {
                  showPopup(
                      context: context,
                      content: AppMessages.cartQytChanged,
                      firstButtonText: 'Continue',
                      titleColor: Colors.red,
                      contentColor: Colors.red,
                      firstButtonAction: () {
                        Get.back();
                        Get.toNamed(CheckoutScreen.routeName);
                      },
                      secondButtonAction: () {
                        Get.back();
                      });
                }
              },
              child: const Text("Checkout"),
            ),
          ),
        ],
      ),
    );
  }
}
