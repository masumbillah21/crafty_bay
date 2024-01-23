import 'package:crafty_bay/utilities/app_colors.dart';
import 'package:crafty_bay/views/screens/shop/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryGrid extends StatelessWidget {
  final int id;
  final String categoryName;
  final String categoryImg;
  const CategoryGrid({
    super.key,
    required this.id,
    required this.categoryName,
    required this.categoryImg,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() =>
            ProductListScreen(categoryId: id, categoryName: categoryName));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 80,
            width: 80,
            child: Image.network(
              categoryImg,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            categoryName,
            style: const TextStyle(
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
