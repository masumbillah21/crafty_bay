import 'package:crafty_bay/global/widgets/product_grid.dart';
import 'package:crafty_bay/products/controllers/product_brand_controller.dart';
import 'package:crafty_bay/utilities/app_messages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrandProductListScreen extends StatelessWidget {
  static const routeName = '/brand-products';
  const BrandProductListScreen({super.key});

  void getProductList(int id) async {
    await Get.find<ProductBrandController>().getProductByBrandId(id);
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> arg = Get.arguments ?? {};
    int id = arg['id'] ?? 0;
    String name = arg['name'] ?? '';
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getProductList(id);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<ProductBrandController>(builder: (product) {
          return Visibility(
            visible: product.inProgress == false,
            replacement: const Center(
              child: CircularProgressIndicator(),
            ),
            child: product.brandProductList?.productList?.isEmpty ?? true
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
                        product.brandProductList?.productList?.length ?? 0,
                    itemBuilder: (context, index) {
                      var item = product.brandProductList!.productList![index];
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
