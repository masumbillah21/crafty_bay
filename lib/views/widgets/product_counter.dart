import 'package:crafty_bay/controllers/helper/quantity_controller.dart';
import 'package:crafty_bay/utilities/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCounter extends StatelessWidget {
  final Function(int) onChange;
  final int initialValue;
  const ProductCounter(
      {super.key, required this.onChange, this.initialValue = 1});

  @override
  Widget build(BuildContext context) {
    final QuantityController quantityController =
        Get.find<QuantityController>();
    quantityController.quantity.value = initialValue;
    return Row(
      children: [
        InkWell(
          onTap: () {
            quantityController.decreaseQuantity();
          },
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(5),
            ),
            padding: const EdgeInsets.all(5),
            child: const Icon(
              Icons.remove,
              size: 12,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Obx(
          () {
            onChange(quantityController.quantity.value);
            return Text(
              quantityController.quantity.string.padLeft(2, '0'),
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            );
          },
        ),
        const SizedBox(
          width: 5,
        ),
        InkWell(
          onTap: () {
            quantityController.increaseQuantity();
          },
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(5),
            ),
            padding: const EdgeInsets.all(5),
            child: const Icon(
              Icons.add,
              size: 12,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
