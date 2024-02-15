import 'package:crafty_bay/global/widgets/product_grid.dart';
import 'package:crafty_bay/home/controllers/bottom_nav_controller.dart';
import 'package:crafty_bay/utilities/app_messages.dart';
import 'package:crafty_bay/wishlist/controllers/get_wishlist_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends StatelessWidget {
  static const routeName = '/wish-list';
  const WishListScreen({super.key});

  void _getWishList() async {
    await Get.find<GetWishlistController>().getWishlist();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getWishList();
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
          title: const Text('Wishlist'),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            _getWishList();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetBuilder<GetWishlistController>(builder: (wish) {
              return Visibility(
                visible: !wish.inProgress,
                replacement: const Center(
                  child: CircularProgressIndicator(),
                ),
                child: wish.wishlist?.wishList?.isNotEmpty ?? true
                    ? GridView.builder(
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
                            child: ProductGrid(
                              productModel: item.product!,
                            ),
                          );
                        },
                      )
                    : Center(
                        child: Text(
                          AppMessages.emptyMessage('Wishlist'),
                        ),
                      ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
