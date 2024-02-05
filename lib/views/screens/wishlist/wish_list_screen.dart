import 'package:crafty_bay/controllers/home/bottom_nav_controller.dart';
import 'package:crafty_bay/controllers/wishlist/wishlist_controller.dart';
import 'package:crafty_bay/utilities/app_messages.dart';
import 'package:crafty_bay/utilities/utilities.dart';
import 'package:crafty_bay/views/widgets/product_grid.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends StatelessWidget {
  static const routeName = '/wish-list';
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<WishlistController>().getWishlist();
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
          title: const Text('Wishlist'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder<WishlistController>(builder: (wish) {
            return Visibility(
              visible: wish.inProgress == false,
              replacement: const Center(
                child: CircularProgressIndicator(),
              ),
              child: wish.wishlist?.wishList?.isEmpty ?? true
                  ? Center(
                      child: Text(
                        AppMessages.emptyMessage('Wishlist'),
                      ),
                    )
                  : GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.90,
                        mainAxisSpacing: 4,
                        crossAxisSpacing: 4,
                      ),
                      itemCount: wish.wishlist?.wishList?.length ?? 0,
                      itemBuilder: (context, index) {
                        var item = wish.wishlist!.wishList![index];
                        return FittedBox(
                          child: Stack(
                            children: [
                              ProductGrid(
                                id: item.productId!,
                                title: item.product!.title!,
                                price: item.product!.price!,
                                image: item.product!.image!,
                                star: item.product!.star!,
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: IconButton(
                                  onPressed: () {
                                    showPopup(
                                      context: context,
                                      onAgree: () {
                                        wish.deleteWishlist(item.productId!);
                                        Get.back();
                                      },
                                      onDisagree: () {
                                        Get.back();
                                      },
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
            );
          }),
        ),
      ),
    );
  }
}