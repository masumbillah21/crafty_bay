import 'dart:async';

import 'package:crafty_bay/auth/controllers/verify_otp_controller.dart';
import 'package:crafty_bay/global/screens/bottom_nav_screen.dart';
import 'package:crafty_bay/users/controllers/read_user_profile_controller.dart';
import 'package:crafty_bay/users/screens/update_profile_screen.dart';
import 'package:crafty_bay/utilities/app_colors.dart';
import 'package:crafty_bay/utilities/app_messages.dart';
import 'package:crafty_bay/utilities/assets_path.dart';
import 'package:crafty_bay/utilities/styles.dart';
import 'package:crafty_bay/utilities/utilities.dart';
import 'package:crafty_bay/wishlist/controllers/wishlist_controller.dart';
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
  final _formKey = GlobalKey<FormState>();
  Timer? _timer;
  int _start = 120;

  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _pinCodeCTEController.dispose();
    _timer!.cancel();
    super.dispose();
  }

  Future<void> _verifyPinCode() async {
    if (_formKey.currentState!.validate()) {
      bool res = await Get.find<VerifyOTPController>()
          .verifyOTP(_pinCodeCTEController.text.trim());
      if (res) {
        successToast(AppMessages.otpSuccess);
        var readProfile = Get.find<ReadUserProfileController>();
        await readProfile.readProfile();
        bool hasProfile = readProfile.hasProfileData;

        await Get.find<WishlistController>().getWishlist();

        if (hasProfile) {
          Get.offNamedUntil(BottomNavScreen.routeName, (route) => false);
        } else {
          Get.offNamedUntil(UpdateProfileScreen.routeName, (route) => false);
        }
      } else {
        errorToast(AppMessages.otpFailed);
      }
    }
  }

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
                  "A 6 digit OTP code has been sent.",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(
                  height: 16,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      PinCodeTextField(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        controller: _pinCodeCTEController,
                        keyboardType: TextInputType.number,
                        backgroundColor: Colors.transparent,
                        appContext: context,
                        autoDisposeControllers: false,
                        length: 6,
                        pinTheme: appOTPStyle,
                        animationType: AnimationType.fade,
                        animationDuration: const Duration(microseconds: 300),
                        enableActiveFill: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return AppMessages.requiredOTP;
                          } else if (value.length < 6) {
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
                        child: GetBuilder<VerifyOTPController>(builder: (user) {
                          return Visibility(
                            visible: user.inProgress == false,
                            replacement: const Center(
                              child: CircularProgressIndicator(),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                _verifyPinCode();
                              },
                              child: const Text('Next'),
                            ),
                          );
                        }),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("This code will expire in "),
                    Text(
                      "${_start}s",
                      style: const TextStyle(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: () {
                    if (_start == 0) {
                      Get.back();
                    }
                  },
                  style: TextButton.styleFrom(
                    foregroundColor:
                        _start != 0 ? Colors.grey : AppColors.primaryColor,
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
