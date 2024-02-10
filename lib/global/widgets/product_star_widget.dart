import 'package:flutter/material.dart';

class ProductStarWidget extends StatelessWidget {
  const ProductStarWidget({
    super.key,
    required this.productStar,
    this.iconSize = 15,
    this.textSize = 14,
  });

  final int productStar;
  final double iconSize;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Icon(
          Icons.star,
          color: Colors.yellow,
          size: iconSize,
        ),
        Text(
          "$productStar",
          style: TextStyle(
            fontSize: textSize,
          ),
        ),
      ],
    );
  }
}
