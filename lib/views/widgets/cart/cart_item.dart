import 'package:crafty_bay/controllers/cart/get_cart_list_controller.dart';
import 'package:crafty_bay/models/cart/cart_model.dart';
import 'package:crafty_bay/utilities/app_colors.dart';
import 'package:crafty_bay/utilities/utilities.dart';
import 'package:crafty_bay/views/widgets/product_counter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartItem extends StatefulWidget {
  final CartModel cartModel;
  final GetCartListController controller;
  const CartItem({
    super.key,
    required this.cartModel,
    required this.controller,
  });

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  late final int _productQyt = widget.cartModel.qty!;

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
                child: Image.network(
                  widget.cartModel.product?.image ?? '',
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
                            widget.cartModel.product?.title ?? '',
                            maxLines: 1,
                            style: const TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Row(
                            children: [
                              Text("Color: ${widget.cartModel.color}"),
                              const Text(", "),
                              Text("Size: ${widget.cartModel.size}"),
                            ],
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          showPopup(
                            context: context,
                            onAgree: () async {
                              await widget.controller
                                  .deleteCartList(widget.cartModel.productId!);
                              Get.back();
                            },
                            onDisagree: () {
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
                        "\$${widget.cartModel.product?.price ?? 0}",
                        style: const TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      ProductCounter(
                        initialValue: _productQyt,
                        onChange: (value) {
                          widget.controller
                              .updateQuantity(widget.cartModel.id!, value);
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
