import 'package:crafty_bay/views/screens/customer_review/customer_review_screen.dart';
import 'package:crafty_bay/views/utilities/app_messages.dart';
import 'package:crafty_bay/views/utilities/assets_path.dart';
import 'package:crafty_bay/views/utilities/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class UpdateProfileScreen extends StatefulWidget {
  static const routeName = '/update-profile';
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final TextEditingController _shippingAddressTEController =
      TextEditingController();
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
                  "Complete Profile",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Get started with us with your details",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(
                  height: 10,
                ),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _firstNameTEController,
                        decoration: const InputDecoration(
                          hintText: 'First Name',
                        ),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return AppMessages.requiredFirstName;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _lastNameTEController,
                        decoration: const InputDecoration(
                          hintText: 'Last Name',
                        ),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return AppMessages.requiredLastName;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _mobileTEController,
                        decoration: const InputDecoration(
                          hintText: 'Mobile',
                        ),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return AppMessages.requiredMobileNumber;
                          } else if (value.length < 11) {
                            return AppMessages.invalidMobileNumber;
                          } else if (!validatePhoneNumber(value)) {
                            return AppMessages.invalidMobileNumber;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _cityTEController,
                        decoration: const InputDecoration(
                          hintText: 'City',
                        ),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return AppMessages.requiredCity;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _shippingAddressTEController,
                        maxLines: 4,
                        decoration: const InputDecoration(
                          hintText: 'Shipping Address',
                        ),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return AppMessages.requiredShippingAddress;
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
                            Get.toNamed(CustomerReviewScreen.routeName);
                          },
                          child: const Text('Complete'),
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
