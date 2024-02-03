import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/utilities/app_colors.dart';
import 'package:flutter/material.dart';

class ProductCarousel extends StatelessWidget {
  ProductCarousel({
    super.key,
    required this.productCarousel,
  });
  final List<String> productCarousel;
  final ValueNotifier<int> _currentIndex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Stack(
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
          items: productCarousel.map((item) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                  ),
                  child: Image.network(
                    item,
                    fit: BoxFit.cover,
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
          child: ValueListenableBuilder(
              valueListenable: _currentIndex,
              builder: (context, index, _) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: productCarousel.map<Widget>(
                    (i) {
                      return Container(
                        margin: const EdgeInsets.all(5),
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: productCarousel[index] == i
                              ? AppColors.primaryColor
                              : Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      );
                    },
                  ).toList(),
                );
              }),
        )
      ],
    );
  }
}
