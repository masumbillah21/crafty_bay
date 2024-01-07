import 'package:crafty_bay/utilities/app_colors.dart';
import 'package:flutter/material.dart';

class ProductGrid extends StatelessWidget {
  final int id;
  final String title;
  final String price;
  final String image;
  final double star;
  const ProductGrid({
    super.key,
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.star,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.cyan.shade50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 120,
            height: 120,
            child: ClipRRect(
              child: Image.network(
                image,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "\$$price",
                      style: const TextStyle(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Text(
                          "$star",
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: AppColors.primaryColor,
                      ),
                      child: const Icon(
                        Icons.favorite_border_outlined,
                        size: 12,
                        color: Colors.white,
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
  }
}
