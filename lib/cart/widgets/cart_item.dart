import 'package:crafty_bay/cart/controllers/get_cart_list_controller.dart';
import 'package:crafty_bay/cart/models/cart_model.dart';
import 'package:crafty_bay/global/widgets/product_counter.dart';
import 'package:crafty_bay/utilities/app_colors.dart';
import 'package:crafty_bay/utilities/assets_path.dart';
import 'package:crafty_bay/utilities/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CartItem extends StatelessWidget {
  final CartModel cartModel;
  final GetCartListController controller;
  final VoidCallback delete;
  const CartItem({
    super.key,
    required this.cartModel,
    required this.controller,
    required this.delete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Row(
        children: [
          SizedBox(
            width: 90,
            height: 90,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                topLeft: Radius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  child: Image.network(
                    cartModel.product?.image ?? '',
                    errorBuilder: (context, _, __) =>
                        SvgPicture.asset(AssetsPath.logo),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cartModel.product?.title ?? '',
                            maxLines: 1,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Row(
                            children: [
                              Text("Color: ${cartModel.color}"),
                              const Text(", "),
                              Text("Size: ${cartModel.size}"),
                            ],
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          showPopup(
                            context: context,
                            firstButtonAction: () async {
                              Get.back();
                              delete();
                            },
                            secondButtonAction: () {
                              Get.back();
                            },
                          );
                        },
                        icon: const Icon(
                          Icons.delete_outline,
                          color: Colors.red,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "৳${cartModel.product?.price ?? 0}",
                        style: const TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      ProductCounter(
                        initialValue: cartModel.qty ?? 2,
                        onChange: (value) {
                          controller.updateQuantity(cartModel.id!, value);
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
