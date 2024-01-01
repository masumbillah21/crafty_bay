import 'package:crafty_bay/utilities/assets_path.dart';
import 'package:crafty_bay/views/screens/profile/update_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CraftyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CraftyAppBar({
    super.key,
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
            Get.toNamed(UpdateProfileScreen.routeName);
          },
          icon: const Icon(
            Icons.person_2_outlined,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.phone_outlined,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_none_outlined,
          ),
        ),
      ],
    );
  }
}
