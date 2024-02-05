import 'package:crafty_bay/controllers/brand/brand_controller.dart';
import 'package:crafty_bay/views/screens/brand/brands_screen.dart';
import 'package:crafty_bay/views/widgets/brand/brand_grid.dart';
import 'package:crafty_bay/views/widgets/home/section_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBrands extends StatelessWidget {
  const AllBrands({super.key, required this.brand});

  final BrandController brand;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: 'Brands',
          onPressed: () {
            Get.toNamed(BrandsScreen.routeName);
          },
        ),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: brand.brandList?.length ?? 0,
            itemBuilder: (context, index) {
              var item = brand.brandList![index];
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: BrandGrid(
                  id: item.id ?? 0,
                  brandName: item.brandName ?? '',
                  brandImg: item.brandImg ?? '',
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
