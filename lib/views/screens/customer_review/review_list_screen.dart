import 'package:crafty_bay/controllers/reviews/get_review_list_controller.dart';
import 'package:crafty_bay/utilities/app_colors.dart';
import 'package:crafty_bay/utilities/app_messages.dart';
import 'package:crafty_bay/views/screens/customer_review/customer_review_screen.dart';
import 'package:crafty_bay/views/widgets/bottom_section_bg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewListScreen extends StatelessWidget {
  static const routeName = '/reviews';
  const ReviewListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int id = Get.arguments;
    Get.find<GetReviewListController>().getReviewList(id);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reviews'),
      ),
      body: Padding(
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
                : Center(
                    child: Text(AppMessages.emptyMessage("Review")),
                  ),
          );
        }),
      ),
    );
  }

  Expanded reviewListSection(GetReviewListController review) {
    return Expanded(
      child: ListView.builder(
          itemCount: review.reviewList?.reviewList?.length ?? 0,
          itemBuilder: (context, index) {
            var item = review.reviewList!.reviewList![index];
            return Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: const CircleAvatar(),
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
            onTap: () {
              Get.toNamed(CustomerReviewScreen.routeName, arguments: id);
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
