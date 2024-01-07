import 'package:crafty_bay/controllers/category_controller.dart';
import 'package:crafty_bay/views/screens/shop/categories_screen.dart';
import 'package:crafty_bay/views/widgets/category_grid.dart';
import 'package:crafty_bay/views/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<CategoryController>().getCategoryList();
    return SizedBox(
      height: 180,
      child: GetBuilder<CategoryController>(builder: (category) {
        return Visibility(
          visible: category.inProgress == false,
          replacement: const Center(
            child: LinearProgressIndicator(),
          ),
          child: Column(
            children: [
              SectionTitle(
                title: 'All Categories',
                onPressed: () {
                  Get.toNamed(CategoriesScreen.routeName);
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
          ),
        );
      }),
    );
  }
}
