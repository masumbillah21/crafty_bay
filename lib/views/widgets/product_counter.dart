import 'package:crafty_bay/utilities/app_colors.dart';
import 'package:flutter/material.dart';

class ProductCounter extends StatelessWidget {
  final ValueNotifier<int> initialValue;
  final int minValue;
  final int maxValue;
  final int step;
  final Function(int) onChange;

  const ProductCounter(
      {super.key,
      required this.initialValue,
      this.minValue = 1,
      this.maxValue = 20,
      required this.onChange,
      this.step = 1});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> value = initialValue;
    return Row(
      children: [
        InkWell(
          onTap: () {
            if (value.value > minValue) {
              value.value -= step;
            }
            onChange(value.value);
          },
          child: Container(
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
        ),
        const SizedBox(
          width: 5,
        ),
        ValueListenableBuilder(
            valueListenable: value,
            builder: (context, qyt, _) {
              return Text(
                qyt.toString().padLeft(2, '0'),
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              );
            }),
        const SizedBox(
          width: 5,
        ),
        InkWell(
          onTap: () {
            if (value.value < maxValue) {
              initialValue.value += 1;
            }
            onChange(value.value);
          },
          child: Container(
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
        ),
      ],
    );
  }
}
