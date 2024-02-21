import 'package:crafty_bay/auth/controllers/auth_controller.dart';
import 'package:crafty_bay/auth/screens/verify_email_screen.dart';
import 'package:crafty_bay/global/widgets/bottom_section_bg.dart';
import 'package:crafty_bay/reviews/controllers/get_review_list_controller.dart';
import 'package:crafty_bay/reviews/screens/customer_review_screen.dart';
import 'package:crafty_bay/users/screens/update_profile_screen.dart';
import 'package:crafty_bay/utilities/app_colors.dart';
import 'package:crafty_bay/utilities/app_messages.dart';
import 'package:crafty_bay/utilities/utilities.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewListScreen extends StatefulWidget {
  static const routeName = '/reviews';
  const ReviewListScreen({super.key});

  @override
  State<ReviewListScreen> createState() => _ReviewListScreenState();
}

class _ReviewListScreenState extends State<ReviewListScreen> {
  final int id = Get.arguments['id'] ?? 0;

  void _fetchReviewList() async {
    await Get.find<GetReviewListController>().getReviewList(id);
  }

  void _handleNavigation() async {
    bool login = await AuthController().checkAuthState();
    var customer = Get.find<AuthController>().customer;
    if (!login) {
      Get.offNamed(VerifyEmailScreen.routeName,
          arguments: {'routeName': ReviewListScreen.routeName, 'id': id});
    } else if (customer?.cusName?.isEmpty ?? true) {
      Get.toNamed(UpdateProfileScreen.routeName);
      errorToast(AppMessages.emptyMessage("profile"));
    } else {
      await Get.toNamed(CustomerReviewScreen.routeName, arguments: {'id': id})
          ?.then((value) => _fetchReviewList());
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchReviewList();
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reviews'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Get.find<GetReviewListController>().getReviewList(id);
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: GetBuilder<GetReviewListController>(builder: (review) {
            return Visibility(
              visible: !review.inProgress,
              replacement: const Center(
                child: CircularProgressIndicator(),
              ),
              child: review.reviewList?.reviewList?.isNotEmpty ?? false
                  ? Column(
                      children: [
                        reviewListSection(review),
                        reviewBottomSection(review, id),
                      ],
                    )
                  : Column(
                      children: [
                        Expanded(
                          child: Center(
                            child: Text(AppMessages.emptyMessage("Review")),
                          ),
                        ),
                        reviewBottomSection(review, id),
                      ],
                    ),
            );
          }),
        ),
      ),
    );
  }

  Expanded reviewListSection(GetReviewListController review) {
    return Expanded(
      child: ListView.builder(
          itemCount: review.reviewList?.reviewList?.length ?? 0,
          itemBuilder: (context, index) {
            var item = review.reviewList!.reviewList!.reversed.toList()[index];
            return Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                    ),
                    title: Text(item.profile?.cusName ?? ''),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, bottom: 10),
                    child: Text(item.description ?? ''),
                  ),
                ],
              ),
            );
          }),
    );
  }

  BottomSectionBg reviewBottomSection(GetReviewListController review, int id) {
    return BottomSectionBg(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Reviews (${review.reviewList?.reviewList?.length ?? 0})",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () async {
              _handleNavigation();
            },
            borderRadius: BorderRadius.circular(50),
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(50),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 9,
                    spreadRadius: 1,
                  )
                ],
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
