import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/controllers/home_carousel_controller.dart';
import 'package:crafty_bay/utilities/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCarousel extends StatelessWidget {
  ProductCarousel({
    super.key,
  });

  final HomeCarouselController productSliderController =
      Get.find<HomeCarouselController>();

  @override
  Widget build(BuildContext context) {
    productSliderController.getHomeCarousel();
    return GetBuilder<HomeCarouselController>(builder: (slider) {
      return Visibility(
        visible: slider.inProgress == false,
        replacement: const Center(
          child: LinearProgressIndicator(),
        ),
        child: Stack(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                viewportFraction: 1,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                autoPlayAnimationDuration: const Duration(seconds: 2),
                onPageChanged: (index, _) {
                  slider.getCurrentIndex(index);
                },
              ),
              items: slider.carouselList?.map((item) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                      ),
                      child: Image.network(
                        item.image ?? '',
                        width: 180,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: productSliderController.carouselList!
                    .asMap()
                    .map(
                      (i, e) {
                        int active = productSliderController.currentIndex;
                        return MapEntry(
                          i,
                          Container(
                            margin: const EdgeInsets.all(5),
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: active == i
                                  ? AppColors.primaryColor
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        );
                      },
                    )
                    .values
                    .toList(),
              ),
            )
          ],
        ),
      );
    });
  }
}
