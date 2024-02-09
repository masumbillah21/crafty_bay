import 'package:crafty_bay/categories/controllers/category_controller.dart';
import 'package:crafty_bay/categories/widgets/category_grid.dart';
import 'package:crafty_bay/home/controllers/bottom_nav_controller.dart';
import 'package:crafty_bay/home/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({super.key, required this.category});

  final CategoryController category;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: 'Categories',
          onPressed: () {
            Get.find<BottomNavController>().changeScreen(1);
          },
        ),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: category.categoryList?.length ?? 0,
            itemBuilder: (context, index) {
              var cat = category.categoryList![index];
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: CategoryGrid(
                  id: cat.id!,
                  categoryName: cat.categoryName!,
                  categoryImg: cat.categoryImg!,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
