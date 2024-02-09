import 'package:crafty_bay/utilities/app_colors.dart';
import 'package:flutter/material.dart';

class BottomSectionBg extends StatelessWidget {
  final Widget child;
  const BottomSectionBg({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.15),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: child,
    );
  }
}
