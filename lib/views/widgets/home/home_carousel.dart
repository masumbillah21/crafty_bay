import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/controllers/home/home_carousel_controller.dart';
import 'package:crafty_bay/utilities/app_colors.dart';
import 'package:crafty_bay/views/screens/product/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCarousel extends StatelessWidget {
  HomeCarousel({
    super.key,
    required this.homeCarousel,
  });

  final HomeCarouselController homeCarousel;

  final ValueNotifier<int> _currentIndex = ValueNotifier(0);

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
              _currentIndex.value = index;
            },
          ),
          items: homeCarousel.carouselList?.map((item) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  padding: const EdgeInsets.only(left: 16),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        item.image ?? '',
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title ?? '',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        item.price ?? '',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width / 2,
                        child: Text(
                          item.shortDes ?? '',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
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
                  ),
                );
              },
            );
          }).toList(),
        ),
        ValueListenableBuilder(
            valueListenable: _currentIndex,
            builder: (context, index, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: homeCarousel.carouselList!
                    .asMap()
                    .map(
                      (i, e) {
                        return MapEntry(
                          i,
                          Container(
                            margin: const EdgeInsets.all(5),
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(
                              color: index == i
                                  ? AppColors.primaryColor
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                color: index == i
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
              );
            })
      ],
    );
  }
}
