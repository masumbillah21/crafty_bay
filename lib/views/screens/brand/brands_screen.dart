import 'package:crafty_bay/controllers/brand/brand_controller.dart';
import 'package:crafty_bay/views/widgets/brand/brand_grid.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrandsScreen extends StatelessWidget {
  static const routeName = '/brands';
  const BrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('All Brands'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Get.find<BrandController>().getBrandList();
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder<BrandController>(builder: (brand) {
            return Visibility(
              visible: brand.inProgress == false,
              replacement: const Center(
                child: CircularProgressIndicator(),
              ),
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 0.75,
                ),
                itemCount: brand.brandList?.length ?? 0,
                itemBuilder: (context, index) {
                  var item = brand.brandList![index];
                  return FittedBox(
                    child: BrandGrid(
                      id: item.id ?? 0,
                      brandName: item.brandName ?? '',
                      brandImg: item.brandImg ?? '',
                    ),
                  );
                },
              ),
            );
          }),
        ),
      ),
    );
  }
}
