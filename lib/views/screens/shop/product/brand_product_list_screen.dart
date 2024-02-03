import 'package:crafty_bay/controllers/product/product_controller.dart';
import 'package:crafty_bay/utilities/app_messages.dart';
import 'package:crafty_bay/views/widgets/product/product_grid.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrandProductListScreen extends StatefulWidget {
  const BrandProductListScreen(
      {super.key, required this.id, required this.name});
  final int id;
  final String name;

  @override
  State<BrandProductListScreen> createState() => _BrandProductListScreenState();
}

class _BrandProductListScreenState extends State<BrandProductListScreen> {
  void getProductList() async {
    await Get.find<ProductController>().getProductByCategoryId(widget.id);
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getProductList();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
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
