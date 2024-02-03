import 'package:crafty_bay/controllers/category/category_controller.dart';
import 'package:crafty_bay/controllers/home/bottom_nav_controller.dart';
import 'package:crafty_bay/views/widgets/category_grid.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesScreen extends StatelessWidget {
  static const routeName = '/categories';
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        Get.find<BottomNavController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          leading: IconButton(
            onPressed: () {
              Get.find<BottomNavController>().backToHome();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          title: const Text('All Categories'),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await Get.find<CategoryController>().getCategoryList();
          },
          child: Padding(
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
                    crossAxisCount: 4,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    // width / height: fixed for *all* items
                    childAspectRatio: 0.75,
                  ),
                  itemCount: category.categoryList?.length ?? 0,
                  itemBuilder: (context, index) {
                    var cat = category.categoryList![index];
                    return CategoryGrid(
                      id: cat.id!,
                      categoryName: cat.categoryName!,
                      categoryImg: cat.categoryImg!,
                    );
                  },
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
