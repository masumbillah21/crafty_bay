import 'package:crafty_bay/controllers/product_details_controller.dart';
import 'package:crafty_bay/models/product_details_model.dart';
import 'package:crafty_bay/utilities/app_colors.dart';
import 'package:crafty_bay/utilities/app_messages.dart';
import 'package:crafty_bay/utilities/utilities.dart';
import 'package:crafty_bay/views/screens/shop/_part/product_carousel.dart';
import 'package:crafty_bay/views/widgets/fixed_bottom_section.dart';
import 'package:crafty_bay/views/widgets/product_counter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const routeName = '/product-details';
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int id = Get.arguments;
    Get.find<ProductDetailsController>().getProductDetailsById(id);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
      ),
      body: GetBuilder<ProductDetailsController>(builder: (product) {
        return Visibility(
          visible: !product.inProgress,
          replacement: const Center(
            child: CircularProgressIndicator(),
          ),
          child: (product.productDetails?.productDetailsList?.isNotEmpty ??
                  false)
              ? Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ProductCarousel(
                              productCarousel:
                                  product.productDetails?.carouselImages ?? [],
                            ),
                            productDetailsBody(
                              product.productDetails?.productDetailsList?[0] ??
                                  ProductDetailsModel(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const FixedBottomSection(),
                  ],
                )
              : Center(
                  child: Text(
                    AppMessages.emptyMessage('Product Details'),
                  ),
                ),
        );
      }),
    );
  }

  Padding productDetailsBody(ProductDetailsModel product) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "${product.product?.title}",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              const ProductCounter(),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Text(
                    "${product.product?.star}",
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                "Reviews",
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: AppColors.primaryColor,
                ),
                child: const Icon(
                  Icons.favorite_border_outlined,
                  size: 17,
                  color: Colors.white,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Color',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: product.color!
                .split(",")
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: InkWell(
                      onTap: () {
                        //
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        margin: const EdgeInsets.only(right: 8),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: getColorByName(e),
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Size',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: product.size!
                .split(',')
                .map(
                  (e) => InkWell(
                    onTap: () {
                      //
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      margin: const EdgeInsets.only(right: 8),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: Colors.black54,
                        ),
                      ),
                      child: Text(e),
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Description',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            product.des!.replaceAll("\\r\\", ""),
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
