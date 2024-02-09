import 'package:crafty_bay/utilities/app_enum.dart';
import 'package:crafty_bay/utilities/assets_path.dart';
import 'package:crafty_bay/utilities/styles.dart';
import 'package:crafty_bay/views/screens/contact/contact_screen.dart';
import 'package:crafty_bay/views/screens/notification/notification_screen.dart';
import 'package:crafty_bay/views/screens/profile/update_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CraftyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppEnum? appEnum;
  const CraftyAppBar({
    super.key,
    this.appEnum,
  });

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: SvgPicture.asset(AssetsPath.navLogo),
      actions: [
        IconButton(
          onPressed: () {
            if (appEnum != AppEnum.profile) {
              Get.toNamed(
                UpdateProfileScreen.routeName,
              );
            }
          },
          icon: const Icon(
            Icons.person_2_outlined,
          ),
          style: iconButtonStyle,
        ),
        IconButton(
          onPressed: () {
            Get.toNamed(
              ContactScreen.routeName,
            );
          },
          icon: const Icon(
            Icons.phone_outlined,
          ),
          style: iconButtonStyle,
        ),
        IconButton(
          onPressed: () {
            Get.toNamed(
              NotificationScreen.routeName,
            );
          },
          icon: const Icon(
            Icons.notifications_none_outlined,
          ),
          style: iconButtonStyle,
        ),
      ],
    );
  }
}
