import 'package:crafty_bay/utilities/app_messages.dart';
import 'package:crafty_bay/views/screens/authentication/verify_pin_code_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerReviewScreen extends StatefulWidget {
  static const routeName = '/customer-review';
  const CustomerReviewScreen({super.key});

  @override
  State<CustomerReviewScreen> createState() => _CustomerReviewScreenState();
}

class _CustomerReviewScreenState extends State<CustomerReviewScreen> {
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _reviewTEController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer Review'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
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
                      controller: _reviewTEController,
                      maxLines: 9,
                      decoration: const InputDecoration(
                        hintText: 'Write Review',
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
                          Get.toNamed(VerifyPinCodeScreen.routeName);
                        },
                        child: const Text('Submit'),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
