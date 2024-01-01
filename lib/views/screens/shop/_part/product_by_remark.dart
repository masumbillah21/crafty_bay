import 'package:crafty_bay/controllers/product_controller.dart';
import 'package:crafty_bay/utilities/app_colors.dart';
import 'package:crafty_bay/views/screens/shop/categories_screen.dart';
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
                    return Card(
                      elevation: 2,
                      color: Colors.cyan.shade50,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: ClipRRect(
                              child: Image.network(
                                product.remarkProductList![index].image!,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Container(
                            padding: const EdgeInsets.all(7),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  product.remarkProductList![index].title ?? '',
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "\$${product.remarkProductList![index].price}",
                                      style: const TextStyle(
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                        ),
                                        Text(
                                          "${product.remarkProductList![index].star}",
                                        ),
                                      ],
                                    ),
                                    IconButton(
                                      style: IconButton.styleFrom(
                                        iconSize: 14,
                                        backgroundColor: AppColors.primaryColor,
                                        foregroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.favorite_border_outlined,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
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
