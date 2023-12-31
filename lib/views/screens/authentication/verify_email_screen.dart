import 'package:crafty_bay/views/screens/authentication/verify_pin_code_screen.dart';
import 'package:crafty_bay/views/utilities/app_messages.dart';
import 'package:crafty_bay/views/utilities/assets_path.dart';
import 'package:crafty_bay/views/utilities/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatefulWidget {
  static const routeName = '/verify-email';
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final TextEditingController _emailTEController = TextEditingController();
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
                  "Welcome Back",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Please Enter Your Email Address",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(
                  height: 10,
                ),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailTEController,
                        decoration: const InputDecoration(
                          hintText: 'Email Address',
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return AppMessages.requiredEmail;
                          } else if (!validateEmail(value)) {
                            return AppMessages.inValidEmail;
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
                            Get.toNamed(VerifyPinCodeScreen.routeName);
                          },
                          child: const Text('Next'),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
