import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/controllers/home_carousel_controller.dart';
import 'package:crafty_bay/utilities/app_colors.dart';
import 'package:crafty_bay/views/screens/shop/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCarousel extends StatelessWidget {
  const HomeCarousel({
    super.key,
    required this.homeCarousel,
  });

  final HomeCarouselController homeCarousel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 200.0,
            viewportFraction: 1,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayAnimationDuration: const Duration(seconds: 2),
            onPageChanged: (index, _) {
              homeCarousel.getCurrentIndex(index);
            },
          ),
          items: homeCarousel.carouselList?.map((item) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        item.image ?? '',
                        width: 180,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.title ?? '',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Get.toNamed(ProductDetailsScreen.routeName,
                                  arguments: item.productId);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: AppColors.primaryColor,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 25,
                                vertical: 5,
                              ),
                            ),
                            child: const Text('Buy Now'),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            );
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: homeCarousel.carouselList!
              .asMap()
              .map(
                (i, e) {
                  int active = homeCarousel.currentIndex;
                  return MapEntry(
                    i,
                    Container(
                      margin: const EdgeInsets.all(5),
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                        color:
                            active == i ? AppColors.primaryColor : Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: active == i
                              ? AppColors.primaryColor
                              : Colors.grey,
                          width: 1.4,
                        ),
                      ),
                    ),
                  );
                },
              )
              .values
              .toList(),
        )
      ],
    );
  }
}
