import 'package:crafty_bay/models/product/product_list_model.dart';
import 'package:crafty_bay/utilities/app_enum.dart';
import 'package:crafty_bay/views/widgets/product/product_grid.dart';
import 'package:flutter/material.dart';

class ProductByRemark extends StatelessWidget {
  final AppEnum appEnum;
  final ProductListModel product;
  const ProductByRemark(
      {required this.appEnum, super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
    );
  }
}
