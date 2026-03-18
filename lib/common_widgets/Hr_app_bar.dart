import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';

import '../navigation_menu/navigation_menu.dart';

class HRAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackTap; // Customizable onBackTap function
  final List<Widget>? actions;

  const HRAppBarWidget({
    Key? key,
    required this.title,
    this.onBackTap,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Iconsax.arrow_left, color: Colors.black),
        onPressed: onBackTap ?? () {
          Get.offAll(() => NavigationMenu()); // Default behavior if
        },
      ),
      elevation: 0,
      title: Text(
        title,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      centerTitle: false,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}