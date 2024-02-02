import 'package:crafty_bay/controllers/auth_controller.dart';
import 'package:crafty_bay/controllers/create_user_profile_controller.dart';
import 'package:crafty_bay/controllers/read_user_profile_controller.dart';
import 'package:crafty_bay/models/customer_model.dart';
import 'package:crafty_bay/utilities/app_messages.dart';
import 'package:crafty_bay/utilities/assets_path.dart';
import 'package:crafty_bay/utilities/utilities.dart';
import 'package:crafty_bay/views/screens/authentication/verify_email_screen.dart';
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
  final TextEditingController _cusNameTEController = TextEditingController();
  final TextEditingController _cusAddTEController = TextEditingController();
  final TextEditingController _cusCityTEController = TextEditingController();
  final TextEditingController _cusPostcodeTEController =
      TextEditingController();
  final TextEditingController _cusPhoneTEController = TextEditingController();

  final TextEditingController _shipNameTEController = TextEditingController();
  final TextEditingController _shipAddTEController = TextEditingController();
  final TextEditingController _shipCityTEController = TextEditingController();
  final TextEditingController _shipPostcodeTEController =
      TextEditingController();
  final TextEditingController _shipPhoneTEController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void _createUserProfile() async {
    if (_formKey.currentState!.validate()) {
      CustomerModel formValue = CustomerModel(
        cusName: _cusNameTEController.text.trim(),
        cusAdd: _cusAddTEController.text.trim(),
        cusCity: _cusCityTEController.text.trim(),
        cusPostcode: _cusPostcodeTEController.text.trim(),
        cusPhone: _cusPhoneTEController.text.trim(),
        shipName: _shipNameTEController.text.trim(),
        shipAdd: _shipAddTEController.text.trim(),
        shipCity: _shipCityTEController.text.trim(),
        shipPostcode: _shipPostcodeTEController.text.trim(),
        shipPhone: _shipPhoneTEController.text.trim(),
      );
      bool res = await Get.find<CreateUserProfileController>()
          .createProfile(formValue);
      if (res) {
        successToast(AppMessages.profileUpdateSuccess);
      } else {
        errorToast(AppMessages.profileUpdateFailed);
      }
    }
  }

  bool _isLogin = false;
  Future<void> _checkLogin() async {
    _isLogin = await Get.find<AuthController>().checkAuthState();
    if (!_isLogin) {
      Get.offNamed(VerifyEmailScreen.routeName);
    } else {
      await Get.find<ReadUserProfileController>().readProfile();
    }
  }

  @override
  void initState() {
    _checkLogin();
    var customer = Get.find<AuthController>().customer;
    _cusNameTEController.text = customer?.cusName ?? '';
    _cusAddTEController.text = customer?.cusAdd ?? '';
    _cusCityTEController.text = customer?.cusCity ?? '';
    _cusPostcodeTEController.text = customer?.cusPostcode ?? '';
    _cusPhoneTEController.text = customer?.cusPhone ?? '';

    _shipNameTEController.text = customer?.shipName ?? '';
    _shipAddTEController.text = customer?.shipAdd ?? '';
    _shipCityTEController.text = customer?.shipCity ?? '';
    _shipPostcodeTEController.text = customer?.shipPostcode ?? '';
    _shipPhoneTEController.text = customer?.shipPhone ?? '';
    super.initState();
  }

  @override
  void dispose() {
    _cusNameTEController.dispose();
    _cusAddTEController.dispose();
    _cusCityTEController.dispose();
    _cusPostcodeTEController.dispose();
    _cusPhoneTEController.dispose();

    _shipNameTEController.dispose();
    _shipAddTEController.dispose();
    _shipCityTEController.dispose();
    _shipPostcodeTEController.dispose();
    _shipPhoneTEController.dispose();
    super.dispose();
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
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Billing Address",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      const Divider(),
                      TextFormField(
                        controller: _cusNameTEController,
                        decoration: const InputDecoration(
                          hintText: 'Name',
                        ),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
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
                        controller: _cusAddTEController,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          hintText: 'Address',
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
                        controller: _cusCityTEController,
                        textInputAction: TextInputAction.next,
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
                        controller: _cusPostcodeTEController,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          hintText: 'Postal Code',
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
                        controller: _cusPhoneTEController,
                        textInputAction: TextInputAction.next,
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
                      const Text(
                        "Shipping Address",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      const Divider(),
                      TextFormField(
                        controller: _shipNameTEController,
                        decoration: const InputDecoration(
                          hintText: 'Name',
                        ),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
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
                        controller: _shipAddTEController,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          hintText: 'Address',
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
                        controller: _shipCityTEController,
                        textInputAction: TextInputAction.next,
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
                        controller: _shipPostcodeTEController,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          hintText: 'Postal Code',
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
                        controller: _shipPhoneTEController,
                        textInputAction: TextInputAction.next,
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
                      SizedBox(
                        width: double.infinity,
                        child: GetBuilder<CreateUserProfileController>(
                            builder: (user) {
                          return Visibility(
                            visible: user.inProgress == false,
                            replacement: const Center(
                              child: CircularProgressIndicator(),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                _createUserProfile();
                              },
                              child: const Text('Complete'),
                            ),
                          );
                        }),
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
