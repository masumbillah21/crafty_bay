import 'package:crafty_bay/controllers/product/special_product_controller.dart';
import 'package:crafty_bay/utilities/app_messages.dart';
import 'package:crafty_bay/views/widgets/product/product_grid.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpecialProductListScreen extends StatefulWidget {
  const SpecialProductListScreen({super.key, required this.name});
  final String name;

  @override
  State<SpecialProductListScreen> createState() =>
      _SpecialProductListScreenState();
}

class _SpecialProductListScreenState extends State<SpecialProductListScreen> {
  void getProductList() async {
    await Get.find<SpecialProductController>().getProductByRemark();
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
        child: GetBuilder<SpecialProductController>(builder: (product) {
          return Visibility(
            visible: product.inProgress == false,
            replacement: const Center(
              child: CircularProgressIndicator(),
            ),
            child: product.remarkProductList?.productList?.isEmpty ?? true
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
                        product.remarkProductList?.productList?.length ?? 0,
                    itemBuilder: (context, index) {
                      var item = product.remarkProductList!.productList![index];
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
