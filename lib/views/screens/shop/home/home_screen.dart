import 'package:crafty_bay/controllers/brand/brand_controller.dart';
import 'package:crafty_bay/controllers/category/category_controller.dart';
import 'package:crafty_bay/controllers/home/home_carousel_controller.dart';
import 'package:crafty_bay/controllers/product/new_product_controller.dart';
import 'package:crafty_bay/controllers/product/popular_product_controller.dart';
import 'package:crafty_bay/controllers/product/special_product_controller.dart';
import 'package:crafty_bay/models/product/product_list_model.dart';
import 'package:crafty_bay/utilities/app_enum.dart';
import 'package:crafty_bay/views/screens/shop/brand/all_brands.dart';
import 'package:crafty_bay/views/screens/shop/category/all_categories.dart';
import 'package:crafty_bay/views/screens/shop/product/new_product_list_screen.dart';
import 'package:crafty_bay/views/screens/shop/product/popular_product_list_screen.dart';
import 'package:crafty_bay/views/screens/shop/product/product_by_remark.dart';
import 'package:crafty_bay/views/screens/shop/product/special_product_list_screen.dart';
import 'package:crafty_bay/views/widgets/crafty_app_bar.dart';
import 'package:crafty_bay/views/widgets/home/home_carousel.dart';
import 'package:crafty_bay/views/widgets/section_title.dart';
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
                child: GetBuilder<BrandController>(builder: (brand) {
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
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 240,
                child: GetBuilder<PopularProductController>(builder: (popular) {
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
                          product:
                              popular.remarkProductList ?? ProductListModel(),
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
                child: GetBuilder<SpecialProductController>(builder: (special) {
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
                          product:
                              special.remarkProductList ?? ProductListModel(),
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
                child: GetBuilder<NewProductController>(builder: (newProduct) {
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
