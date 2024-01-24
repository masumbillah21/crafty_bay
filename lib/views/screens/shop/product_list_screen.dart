import 'package:crafty_bay/controllers/product_controller.dart';
import 'package:crafty_bay/utilities/app_messages.dart';
import 'package:crafty_bay/views/widgets/product_grid.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen(
      {super.key, required this.categoryId, required this.categoryName});
  final int categoryId;
  final String categoryName;

  void getProductList() async {
    await Get.find<ProductController>().getProductByCategoryId(categoryId);
  }

  @override
  Widget build(BuildContext context) {
    getProductList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<ProductController>(builder: (product) {
          return Visibility(
            visible: product.inProgress == false,
            replacement: const Center(
              child: CircularProgressIndicator(),
            ),
            child: product.categoryProductList?.productList?.isEmpty ?? true
                ? Center(
                    child: Text(
                      AppMessages.emptyMessage('product'),
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
                          id: item.id!,
                          title: item.title!,
                          price: item.price!,
                          image: item.image!,
                          star: item.star!,
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
