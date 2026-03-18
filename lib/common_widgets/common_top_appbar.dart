import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:school_management/screen/manu/profile_menu_screen.dart';
import 'package:school_management/screen/noticebaord/noticeboard.dart';
import '../../constant/colors.dart';
import '../../constant/sizes.dart';

class CommonTopAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onMenuTap;
  final VoidCallback? onNotificationTap;
  final PreferredSizeWidget? bottom;

  const CommonTopAppBar({
    super.key,
    required this.title,
    this.onMenuTap,
    this.onNotificationTap,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {

    return AppBar(
      elevation: 0,
      backgroundColor: appColor,
      centerTitle: true,

      title: Text(
        title,
        style: const TextStyle(
          color: whiteColor,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),

      /// Menu Button
      leading: Builder(
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius:
                  BorderRadius.circular(HRSizes.cardRadiusMd),
                ),
                child: const Icon(Icons.menu, color: appColor),
              ),
            ),
          );
        },
      ),
      /// Notification Icon
      actions: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: GestureDetector(
            onTap: () {
              Get.to(() => NoticeBoardScreen());
            },
            child: Container(
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(HRSizes.cardRadiusMd),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: Icon(Icons.notifications, color: appColor),
              ),
            ),
          ),
        ),
      ],

      /// TabBar Support
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0));
}