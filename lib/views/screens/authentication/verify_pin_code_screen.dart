import 'dart:async';

import 'package:crafty_bay/controllers/user_controller.dart';
import 'package:crafty_bay/utilities/app_colors.dart';
import 'package:crafty_bay/utilities/app_messages.dart';
import 'package:crafty_bay/utilities/app_theme_data.dart';
import 'package:crafty_bay/utilities/assets_path.dart';
import 'package:crafty_bay/utilities/utilities.dart';
import 'package:crafty_bay/views/screens/bottom_nav_screen.dart';
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

  Future<void> _verifyPicCode() async {
    if (_formKey.currentState!.validate()) {
      bool res = await Get.find<UserController>()
          .verifyPicCode(_pinCodeCTEController.text.trim());
      if (res) {
        successToast(AppMessages.otpSuccess);
        Get.offNamedUntil(BottomNavScreen.routeName, (route) => false);
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
                  "A 4 digit OTP code has been sent.",
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
                        child: GetBuilder<UserController>(builder: (user) {
                          return Visibility(
                            visible: user.inProgress == false,
                            replacement: const Center(
                              child: CircularProgressIndicator(),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                _verifyPicCode();
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
