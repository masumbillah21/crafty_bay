import 'package:crafty_bay/auth/controllers/auth_controller.dart';
import 'package:crafty_bay/auth/screens/verify_email_screen.dart';
import 'package:crafty_bay/brands/screens/brand_product_list_screen.dart';
import 'package:crafty_bay/cart/controllers/add_to_cart_controller.dart';
import 'package:crafty_bay/cart/models/cart_model.dart';
import 'package:crafty_bay/global/widgets/bottom_section_bg.dart';
import 'package:crafty_bay/global/widgets/product_counter.dart';
import 'package:crafty_bay/products/controllers/product_details_controller.dart';
import 'package:crafty_bay/products/models/product_details_model.dart';
import 'package:crafty_bay/products/widgets/product_carousel.dart';
import 'package:crafty_bay/reviews/screens/review_list_screen.dart';
import 'package:crafty_bay/utilities/app_colors.dart';
import 'package:crafty_bay/utilities/app_messages.dart';
import 'package:crafty_bay/utilities/utilities.dart';
import 'package:crafty_bay/wishlist/controllers/wishlist_controller.dart';
import 'package:crafty_bay/wishlist/controllers/wishlist_store_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const routeName = '/product-details';
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int productQyt = 1;

  final ValueNotifier<bool> _login = ValueNotifier(false);

  void _isLogin() async {
    _login.value = await Get.find<AuthController>().isLogin();
  }

  void addToCard(
      {required int productId,
      required String color,
      required String size,
      required int quantity}) async {
    CartModel cartModel = CartModel(
        productId: productId, color: color, size: size, qty: quantity);
    bool res = await Get.find<AddToCartController>().addToCart(cartModel);
    if (res) {
      successToast("Cart Successfully Added.");
    } else {
      errorToast("Failed to add into cart, try again later.");
    }
  }

  void updateProductQty(int value) {
    productQyt = value;
  }

  @override
  Widget build(BuildContext context) {
    int id = Get.arguments;

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _isLogin();
      Get.find<ProductDetailsController>().getProductDetailsById(id);
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
      ),
      body: GetBuilder<ProductDetailsController>(builder: (product) {
        return Visibility(
          visible: !product.inProgress,
          replacement: const Center(
            child: CircularProgressIndicator(),
          ),
          child: (product.productDetails?.productDetailsList?.isNotEmpty ??
                  false)
              ? Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ProductCarousel(
                              productCarousel:
                                  product.productDetails?.carouselImages ?? [],
                            ),
                            productDetailsBody(
                              product: product,
                              productQyt: productQyt,
                              onQytUpdate: updateProductQty,
                            ),
                          ],
                        ),
                      ),
                    ),
                    buildBottomSectionBg(product, id),
                  ],
                )
              : Center(
                  child: Text(
                    AppMessages.emptyMessage('Product Details'),
                  ),
                ),
        );
      }),
    );
  }

  Widget buildBottomSectionBg(
    ProductDetailsController product,
    int id,
  ) {
    return BottomSectionBg(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Price",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "৳${product.productDetails?.productDetailsList?[0].product?.price ?? 0}",
                style: const TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 150,
            child: GetBuilder<AddToCartController>(builder: (cart) {
              return Visibility(
                visible: !cart.inProgress,
                replacement: const Center(
                  child: CircularProgressIndicator(),
                ),
                child: (_login.value)
                    ? ElevatedButton(
                        onPressed: () {
                          if (product.selectedColor.isEmpty) {
                            errorToast("Select a color.");
                          } else if (product.selectedSize.value.isEmpty) {
                            errorToast("Select a size.");
                          } else {
                            addToCard(
                              productId: id,
                              color: product.selectedColor.value,
                              size: product.selectedSize.value,
                              quantity: productQyt,
                            );
                          }
                        },
                        child: const Text("Add To Cart"),
                      )
                    : ElevatedButton(
                        onPressed: () {
                          Get.offAndToNamed(VerifyEmailScreen.routeName);
                        },
                        child: const Text("Login"),
                      ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget productDetailsBody({
    required ProductDetailsController product,
    required int productQyt,
    required Function(int) onQytUpdate,
  }) {
    ProductDetailsModel productDetails =
        product.productDetails?.productDetailsList?[0] ?? ProductDetailsModel();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "${productDetails.product?.title}",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              ProductCounter(
                initialValue: productQyt,
                onChange: (v) {
                  onQytUpdate(v);
                },
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              const Text(
                'Brand: ',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(BrandProductListScreen.routeName, arguments: {
                    'id': product.productDetails!.productDetailsList![0]
                        .product!.brand!.id!,
                    'name': product.productDetails!.productDetailsList![0]
                        .product!.brand!.brandName!,
                  });
                },
                child: Text(
                  product.productDetails!.productDetailsList![0].product!.brand!
                      .brandName!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Text(
                    "${productDetails.product?.star}",
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(ReviewListScreen.routeName,
                      arguments: productDetails.productId!);
                },
                child: const Text(
                  "Reviews",
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              wishListSection(productDetails),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Color',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          colorSelector(product),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Size',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          sizeSelector(productDetails, product),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Description',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            productDetails.des!.replaceAll("\\r\\", ""),
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget wishListSection(ProductDetailsModel productDetails) {
    return GetBuilder<WishlistStoreController>(builder: (store) {
      bool isInWish =
          store.productListInWishlist.contains(productDetails.productId!);
      return Visibility(
        visible: store.productId != productDetails.productId!,
        replacement: const SizedBox(
          height: 10,
          width: 10,
          child: CircularProgressIndicator(
            strokeWidth: 2,
          ),
        ),
        child: GestureDetector(
          onTap: () async {
            if (isInWish) {
              showPopup(
                context: context,
                firstButtonAction: () async {
                  Get.back();
                  bool res = await Get.find<WishlistController>()
                      .deleteWishlist(productDetails.productId!);

                  if (res) {
                    successToast("Deleted from wishlist");
                  } else {
                    errorToast("Failed to delete");
                  }
                },
                secondButtonAction: () {
                  Get.back();
                },
              );
            } else {
              bool res = await Get.find<WishlistController>()
                  .createWishlist(productDetails.productId!);
              if (res) {
                successToast("Add to wishlist");
              } else {
                errorToast("Failed to add");
              }
            }
          },
          child: Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: isInWish ? Colors.red : AppColors.primaryColor,
            ),
            child: Icon(
              isInWish ? Icons.delete : Icons.favorite_border_outlined,
              size: 17,
              color: Colors.white,
            ),
          ),
        ),
      );
    });
  }

  Widget sizeSelector(
      ProductDetailsModel productDetails, ProductDetailsController product) {
    return Row(
      children: productDetails.size!
          .split(',')
          .map(
            (e) => Obx(
              () => InkWell(
                onTap: () {
                  product.selectedSize(e);
                },
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  height: 40,
                  width: 40,
                  margin: const EdgeInsets.only(right: 8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: product.selectedSize.value == e
                        ? AppColors.primaryColor
                        : Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: product.selectedSize.value == e
                          ? AppColors.primaryColor
                          : Colors.black54,
                    ),
                  ),
                  child: Text(
                    e,
                    style: TextStyle(
                      color: product.selectedSize.value == e
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget colorSelector(ProductDetailsController product) {
    return Row(
      children: product.productDetails!.productDetailsList![0].color!
          .split(",")
          .map(
            (e) => Obx(() => Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: InkWell(
                    onTap: () {
                      product.selectedColor(e);
                    },
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      height: 40,
                      width: 40,
                      margin: const EdgeInsets.only(right: 8),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: getColorByName(e),
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: e == 'White' ? Colors.grey : getColorByName(e),
                        ),
                      ),
                      child: product.selectedColor.value == e
                          ? Icon(
                              Icons.done,
                              color: e == 'White' ? Colors.black : Colors.white,
                            )
                          : null,
                    ),
                  ),
                )),
          )
          .toList(),
    );
  }
}
