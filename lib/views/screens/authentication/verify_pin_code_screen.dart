import 'package:crafty_bay/utilities/app_colors.dart';
import 'package:crafty_bay/utilities/app_messages.dart';
import 'package:crafty_bay/utilities/app_theme_data.dart';
import 'package:crafty_bay/utilities/assets_path.dart';
import 'package:crafty_bay/views/screens/profile/update_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyPinCodeScreen extends StatefulWidget {
  static const routeName = '/verify-pin';
  const VerifyPinCodeScreen({super.key});

  @override
  State<VerifyPinCodeScreen> createState() => _VerifyPinCodeScreenState();
}

class _VerifyPinCodeScreenState extends State<VerifyPinCodeScreen> {
  final TextEditingController _pinCodeCTEController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AssetsPath.logo,
                  alignment: Alignment.center,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Enter OTP Code",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "A 4 digit OTP code has been sent.",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(
                  height: 16,
                ),
                Form(
                  child: Column(
                    children: [
                      PinCodeTextField(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        controller: _pinCodeCTEController,
                        keyboardType: TextInputType.number,
                        backgroundColor: Colors.transparent,
                        appContext: context,
                        autoDisposeControllers: false,
                        length: 4,
                        pinTheme: AppThemeData.appOTPStyle,
                        animationType: AnimationType.fade,
                        animationDuration: const Duration(microseconds: 300),
                        enableActiveFill: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return AppMessages.requiredOTP;
                          } else if (value.length < 4) {
                            return AppMessages.otpLength;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.offAllNamed(UpdateProfileScreen.routeName);
                          },
                          child: const Text('Next'),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("This code will expire in "),
                    Text(
                      "120s",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.grey,
                  ),
                  child: const Text('Resent Code'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
