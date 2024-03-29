import 'package:crafty_bay/global/widgets/product_grid.dart';
import 'package:crafty_bay/products/controllers/product_category_controller.dart';
import 'package:crafty_bay/utilities/app_messages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryProductListScreen extends StatelessWidget {
  static const routeName = "/category-products";
  const CategoryProductListScreen({super.key});

  void _getProductList(int id) async {
    await Get.find<ProductCategoryController>().getProductByCategoryId(id);
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> arg = Get.arguments ?? {};
    int id = arg['id'] ?? 0;
    String name = arg['name'] ?? '';
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _getProductList(id);
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<ProductCategoryController>(builder: (product) {
          return Visibility(
            visible: product.inProgress == false,
            replacement: const Center(
              child: CircularProgressIndicator(),
            ),
            child: product.categoryProductList?.productList?.isEmpty ?? true
                ? Center(
                    child: Text(
                      AppMessages.emptyMessage('Product'),
                    ),
                  )
                : GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.90,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                    ),
                    itemCount:
                        product.categoryProductList?.productList?.length ?? 0,
                    itemBuilder: (context, index) {
                      var item =
                          product.categoryProductList!.productList![index];
                      return FittedBox(
                        child: ProductGrid(
                          productModel: item,
                        ),
                      );
                    },
                  ),
          );
        }),
      ),
    );
  }
}
