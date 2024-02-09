import 'package:crafty_bay/brands/controllers/brand_controller.dart';
import 'package:crafty_bay/categories/controllers/category_controller.dart';
import 'package:crafty_bay/global/widgets/app_navigation_drawer_widget.dart';
import 'package:crafty_bay/global/widgets/crafty_app_bar.dart';
import 'package:crafty_bay/home/controllers/home_carousel_controller.dart';
import 'package:crafty_bay/home/screens/_part/all_brands.dart';
import 'package:crafty_bay/home/screens/_part/all_categories.dart';
import 'package:crafty_bay/home/screens/_part/product_by_remark.dart';
import 'package:crafty_bay/home/widgets/home_carousel.dart';
import 'package:crafty_bay/home/widgets/section_title.dart';
import 'package:crafty_bay/products/controllers/new_product_controller.dart';
import 'package:crafty_bay/products/controllers/popular_product_controller.dart';
import 'package:crafty_bay/products/controllers/special_product_controller.dart';
import 'package:crafty_bay/products/models/product_list_model.dart';
import 'package:crafty_bay/products/screens/new_product_list_screen.dart';
import 'package:crafty_bay/products/screens/popular_product_list_screen.dart';
import 'package:crafty_bay/products/screens/special_product_list_screen.dart';
import 'package:crafty_bay/utilities/app_enum.dart';
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
      drawer: AppNavigationDrawerWidget(),
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
                child: GetBuilder<HomeCarouselController>(
                    init: Get.find<HomeCarouselController>(),
                    builder: (carousel) {
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
                child: GetBuilder<BrandController>(
                    init: Get.find<BrandController>(),
                    builder: (brand) {
                      return Visibility(
                        visible: !brand.inProgress,
                        replacement: const Center(
                          child: CircularProgressIndicator(),
                        ),
                        child: AllBrands(
                          brand: brand,
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 180,
                child: GetBuilder<CategoryController>(
                    init: Get.find<CategoryController>(),
                    builder: (category) {
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
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 240,
                child: GetBuilder<PopularProductController>(
                    init: Get.find<PopularProductController>(),
                    builder: (popular) {
                      return Visibility(
                        visible: !popular.inProgress,
                        replacement: const Center(
                          child: CircularProgressIndicator(),
                        ),
                        child: Column(
                          children: [
                            SectionTitle(
                              title: AppEnum.Popular.name,
                              onPressed: () {
                                Get.to(
                                  () => PopularProductListScreen(
                                    name: AppEnum.Popular.name,
                                  ),
                                );
                              },
                            ),
                            ProductByRemark(
                              appEnum: AppEnum.Popular,
                              product: popular.remarkProductList ??
                                  ProductListModel(),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 240,
                child: GetBuilder<SpecialProductController>(
                    init: Get.find<SpecialProductController>(),
                    builder: (special) {
                      return Visibility(
                        visible: !special.inProgress,
                        replacement: const Center(
                          child: CircularProgressIndicator(),
                        ),
                        child: Column(
                          children: [
                            SectionTitle(
                              title: AppEnum.Special.name,
                              onPressed: () {
                                Get.to(
                                  () => SpecialProductListScreen(
                                    name: AppEnum.Special.name,
                                  ),
                                );
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ProductByRemark(
                              appEnum: AppEnum.Special,
                              product: special.remarkProductList ??
                                  ProductListModel(),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 260,
                child: GetBuilder<NewProductController>(
                    init: Get.find<NewProductController>(),
                    builder: (newProduct) {
                      return Visibility(
                        visible: !newProduct.inProgress,
                        replacement: const Center(
                          child: CircularProgressIndicator(),
                        ),
                        child: Column(
                          children: [
                            SectionTitle(
                              title: AppEnum.New.name,
                              onPressed: () {
                                Get.to(
                                  () => NewProductListScreen(
                                    name: AppEnum.New.name,
                                  ),
                                );
                              },
                            ),
                            ProductByRemark(
                              appEnum: AppEnum.New,
                              product: newProduct.remarkProductList ??
                                  ProductListModel(),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
