import 'package:crafty_bay/controllers/category_controller.dart';
import 'package:crafty_bay/controllers/home_carousel_controller.dart';
import 'package:crafty_bay/views/screens/shop/_part/all_categories.dart';
import 'package:crafty_bay/views/screens/shop/_part/home_carousel.dart';
import 'package:crafty_bay/views/screens/shop/_part/product_by_remark.dart';
import 'package:crafty_bay/views/widgets/crafty_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});

  TextField get appSearchBox {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade200,
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.grey,
        ),
        hintText: "Search",
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey.shade200,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CraftyAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              appSearchBox,
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 230,
                child: GetBuilder<HomeCarouselController>(builder: (carousel) {
                  return Visibility(
                    visible: !carousel.inProgress,
                    replacement: const Center(
                      child: CircularProgressIndicator(),
                    ),
                    child: HomeCarousel(
                      homeCarousel: carousel,
                    ),
                  );
                }),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 180,
                child: GetBuilder<CategoryController>(builder: (category) {
                  return Visibility(
                    visible: !category.inProgress,
                    replacement: const Center(
                      child: CircularProgressIndicator(),
                    ),
                    child: AllCategories(
                      category: category,
                    ),
                  );
                }),
              ),
              const ProductByRemark(remark: 'Popular'),
              const SizedBox(
                height: 10,
              ),
              const ProductByRemark(remark: 'Special'),
              const SizedBox(
                height: 10,
              ),
              const ProductByRemark(remark: 'New'),
            ],
          ),
        ),
      ),
    );
  }
}
