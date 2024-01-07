import 'package:crafty_bay/controllers/category_controller.dart';
import 'package:crafty_bay/utilities/app_colors.dart';
import 'package:crafty_bay/views/screens/shop/categories_screen.dart';
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
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 80,
                            width: 80,
                            child: Image.network(
                              category.categoryList![index].categoryImg!,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            category.categoryList![index].categoryName ?? '',
                            style: const TextStyle(
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
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
