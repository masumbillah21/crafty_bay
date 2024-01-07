import 'package:crafty_bay/controllers/product_controller.dart';
import 'package:crafty_bay/views/screens/shop/categories_screen.dart';
import 'package:crafty_bay/views/widgets/product_grid.dart';
import 'package:crafty_bay/views/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductByRemark extends StatelessWidget {
  final String remark;
  const ProductByRemark({required this.remark, super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<ProductController>().getProductByRemark(remark);
    return SizedBox(
      height: 250,
      child: GetBuilder<ProductController>(builder: (product) {
        return Visibility(
          visible: product.inProgress == false,
          replacement: const Center(
            child: LinearProgressIndicator(),
          ),
          child: Column(
            children: [
              SectionTitle(
                title: remark,
                onPressed: () {
                  Get.toNamed(CategoriesScreen.routeName);
                },
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: product.remarkProductList?.length ?? 0,
                  itemBuilder: (context, index) {
                    return ProductGrid(
                      id: product.remarkProductList![index].id!,
                      title: product.remarkProductList![index].title!,
                      price: product.remarkProductList![index].price!,
                      image: product.remarkProductList![index].image!,
                      star: product.remarkProductList![index].star!,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
