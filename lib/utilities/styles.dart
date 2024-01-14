import 'package:crafty_bay/utilities/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

ButtonStyle get iconButtonStyle => IconButton.styleFrom(
      backgroundColor: Colors.grey.shade300,
      foregroundColor: Colors.black54,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
    );

PinTheme get appOTPStyle => PinTheme(
      inactiveColor: AppColors.primaryColor,
      inactiveFillColor: Colors.white,
      selectedColor: AppColors.primaryColor,
      activeColor: Colors.white,
      selectedFillColor: AppColors.primaryColor,
      shape: PinCodeFieldShape.box,
      borderRadius: BorderRadius.circular(5),
      fieldHeight: 50,
      borderWidth: 0.5,
      fieldWidth: 45,
      activeFillColor: Colors.white,
    );
