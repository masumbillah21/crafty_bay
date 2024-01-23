import 'package:crafty_bay/controllers/bottom_nav_controller.dart';
import 'package:crafty_bay/controllers/product_controller.dart';
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
      height: 230,
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
                  Get.find<BottomNavController>().changeScreen(1);
                },
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: product.remarkProductList?.length ?? 0,
                  itemBuilder: (context, index) {
                    var item = product.remarkProductList![index];
                    return ProductGrid(
                      id: item.id!,
                      title: item.title!,
                      price: item.price!,
                      image: item.image!,
                      star: item.star!,
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
