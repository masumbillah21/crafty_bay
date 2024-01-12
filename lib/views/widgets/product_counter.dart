import 'package:crafty_bay/utilities/app_colors.dart';
import 'package:flutter/material.dart';

class ProductCounter extends StatelessWidget {
  const ProductCounter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(5),
          ),
          padding: const EdgeInsets.all(5),
          child: const Icon(
            Icons.remove,
            size: 12,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        const Text(
          '01',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(5),
          ),
          padding: const EdgeInsets.all(5),
          child: const Icon(
            Icons.add,
            size: 12,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
