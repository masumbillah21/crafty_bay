import 'package:crafty_bay/utilities/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCounter extends StatelessWidget {
  final dynamic controller;
  const ProductCounter({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          children: [
            InkWell(
              onTap: () {
                controller.decreaseQyt();
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
            Text(
              controller.productQuantity.string.padLeft(2, '0'),
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            InkWell(
              onTap: () {
                controller.increaseQyt();
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
        ));
  }
}
