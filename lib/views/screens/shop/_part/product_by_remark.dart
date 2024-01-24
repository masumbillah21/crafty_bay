import 'package:crafty_bay/controllers/bottom_nav_controller.dart';
import 'package:crafty_bay/models/product_list_model.dart';
import 'package:crafty_bay/views/widgets/product_grid.dart';
import 'package:crafty_bay/views/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductByRemark extends StatelessWidget {
  final String remark;
  final ProductListModel product;
  const ProductByRemark(
      {required this.remark, super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
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
              itemCount: product.productList?.length ?? 0,
              itemBuilder: (context, index) {
                var item = product.productList![index];
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
  }
}
