import 'package:crafty_bay/views/utilities/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class AppThemeData {
  static ThemeData lightThemeData = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      shape: BorderDirectional(
        bottom: BorderSide(
          width: 1.0,
          color: Colors.grey.shade400,
        ),
      ),
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 30,
        color: Colors.black,
        fontWeight: FontWeight.w500,
        letterSpacing: 2,
      ),
      headlineSmall: TextStyle(
        fontSize: 15,
        color: Colors.grey,
        fontWeight: FontWeight.w400,
        letterSpacing: 2,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        color: Colors.grey[500],
        fontWeight: FontWeight.normal,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          color: AppColors.colorSwatch[500]!,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          color: AppColors.colorSwatch[500]!,
          width: 1.4,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 1.4,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(vertical: 19),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 1,
        ),
      ),
    ),
  );

  static PinTheme appOTPStyle = PinTheme(
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
}
