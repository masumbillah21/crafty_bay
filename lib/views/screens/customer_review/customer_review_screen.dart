import 'package:crafty_bay/controllers/auth/auth_controller.dart';
import 'package:crafty_bay/controllers/reviews/create_review_controller.dart';
import 'package:crafty_bay/models/reviews/review_model.dart';
import 'package:crafty_bay/utilities/app_messages.dart';
import 'package:crafty_bay/utilities/utilities.dart';
import 'package:crafty_bay/views/screens/authentication/verify_email_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerReviewScreen extends StatefulWidget {
  static const routeName = '/customer-review';
  const CustomerReviewScreen({super.key});

  @override
  State<CustomerReviewScreen> createState() => _CustomerReviewScreenState();
}

class _CustomerReviewScreenState extends State<CustomerReviewScreen> {
  final _formKey = GlobalKey<FormState>();
  final int _productId = Get.arguments;
  final TextEditingController _reviewTEController = TextEditingController();
  final ValueNotifier _rating = ValueNotifier(5);

  void _createProductReview() async {
    if (_formKey.currentState!.validate()) {
      ReviewModel reviewModel = ReviewModel(
        productId: _productId,
        rating: _rating.value,
        description: _reviewTEController.text.trim(),
      );
      bool res =
          await Get.find<CreateReviewController>().createReview(reviewModel);
      if (res) {
        _reviewTEController.clear();
        successToast("Review added successfully.");
      } else {
        errorToast("Failed to add review, try again later.");
      }
    }
  }

  void _isLogin() async {
    bool login = await Get.find<AuthController>().isLogin();
    if (login) {
      Get.offAndToNamed(VerifyEmailScreen.routeName);
    }
  }

  @override
  void initState() {
    _isLogin();
    super.initState();
  }

  @override
  void dispose() {
    _reviewTEController.dispose();
    _rating.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Review $_productId'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    Text(
                      'Rating',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [1, 2, 3, 4, 5]
                          .map(
                            (e) => InkWell(
                              onTap: () {
                                _rating.value = e;
                              },
                              child: ValueListenableBuilder(
                                  valueListenable: _rating,
                                  builder: (context, value, _) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: Icon(
                                        value >= e
                                            ? Icons.star
                                            : Icons.star_border,
                                        size: 30,
                                        color: value >= e
                                            ? Colors.amber
                                            : Colors.grey,
                                      ),
                                    );
                                  }),
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child:
                          GetBuilder<CreateReviewController>(builder: (review) {
                        return Visibility(
                          visible: !review.inProgress,
                          replacement: const Center(
                            child: CircularProgressIndicator(),
                          ),
                          child: ElevatedButton(
                            onPressed: _createProductReview,
                            child: const Text('Submit'),
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
    );
  }
}
