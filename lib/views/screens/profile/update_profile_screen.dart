import 'package:crafty_bay/controllers/auth_controller.dart';
import 'package:crafty_bay/controllers/create_user_profile_controller.dart';
import 'package:crafty_bay/controllers/read_user_profile_controller.dart';
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
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final TextEditingController _shippingAddressTEController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void _createUserProfile() async {
    if (_formKey.currentState!.validate()) {
      bool res = await Get.find<CreateUserProfileController>().createProfile(
        firstName: _firstNameTEController.text.trim(),
        lastName: _lastNameTEController.text.trim(),
        mobile: _mobileTEController.text.trim(),
        city: _cityTEController.text.trim(),
        shippingAddress: _shippingAddressTEController.text.trim(),
      );
      if (res) {
        successToast(AppMessages.profileUpdateSuccess);
      } else {
        errorToast(AppMessages.profileUpdateSuccess);
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
    var user = Get.find<AuthController>().user;
    _firstNameTEController.text = user?.firstName ?? '';
    _lastNameTEController.text = user?.lastName ?? '';
    _mobileTEController.text = user?.mobile ?? '';
    _cityTEController.text = user?.city ?? '';
    _shippingAddressTEController.text = user?.shippingAddress ?? '';
    super.initState();
  }

  @override
  void dispose() {
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileTEController.dispose();
    _cityTEController.dispose();
    _shippingAddressTEController.dispose();

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
                    children: [
                      TextFormField(
                        controller: _firstNameTEController,
                        decoration: const InputDecoration(
                          hintText: 'First Name',
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
                        controller: _lastNameTEController,
                        textInputAction: TextInputAction.next,
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
                      TextFormField(
                        controller: _cityTEController,
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
                        controller: _shippingAddressTEController,
                        maxLines: 4,
                        decoration: const InputDecoration(
                          hintText: 'Shipping Address',
                        ),
                        keyboardType: TextInputType.text,
                        onFieldSubmitted: (_) {
                          _createUserProfile();
                        },
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
