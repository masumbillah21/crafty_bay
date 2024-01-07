import 'package:crafty_bay/controllers/category_controller.dart';
import 'package:crafty_bay/utilities/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesScreen extends StatelessWidget {
  static const routeName = '/categories';
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<CategoryController>().getCategoryList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Categories'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<CategoryController>(builder: (category) {
          return Visibility(
            visible: category.inProgress == false,
            replacement: const Center(
              child: CircularProgressIndicator(),
            ),
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                // width / height: fixed for *all* items
                childAspectRatio: 0.75,
              ),
              itemCount: category.categoryList?.length ?? 0,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 110,
                      width: 110,
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
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
