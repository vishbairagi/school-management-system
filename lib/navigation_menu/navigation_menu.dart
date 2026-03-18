import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:school_management/constant/colors.dart';
import 'package:school_management/screen/Homework/homework.dart';
import 'package:school_management/screen/Live/live.dart';
import 'package:school_management/screen/fees/fees.dart';
import '../screen/dashboard/dashboard.dart';



class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      bottomNavigationBar: Obx(() => NavigationBar(
          height: 60,
          elevation: 1,
          selectedIndex: controller.selectedIndex.value,
          backgroundColor:  Colors.white,
          indicatorColor:  appColor.withOpacity(0.2),
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          destinations: [

            NavigationDestination(icon: Icon(Iconsax.home), label: "Home"),
            NavigationDestination(icon: Icon(Iconsax.mobile), label: "Live"),
            NavigationDestination(icon: Icon(Iconsax.book), label: "Homework"),
            NavigationDestination(icon: Icon(Iconsax.wallet_money), label: "Fees"),

          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    DashboardScreen(),

    LiveScreen(),

    HomeworkScreen(),

    FeesScreen(),
  ];
}




/*

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:school_management/constant/colors.dart';
import 'package:school_management/screen/Homework/homework.dart';
import 'package:school_management/screen/Live/live.dart';
import 'package:school_management/screen/fees/fees.dart';
import '../screen/dashboard/dashboard.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        physics: const BouncingScrollPhysics(),
        onPageChanged: (index) {
          controller.selectedIndex.value = index; // Update bottom nav when swipe
        },
        children: controller.screens,
      ),
      bottomNavigationBar: Obx(
            () => NavigationBar(
          height: 60,
          elevation: 1,
          selectedIndex: controller.selectedIndex.value,
          backgroundColor: Colors.white,
          indicatorColor: appColor.withOpacity(0.2),
          onDestinationSelected: (index) {
            controller.selectedIndex.value = index;
            controller.pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            ); // Animate swipe on tap
          },
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: "Home"),
            NavigationDestination(icon: Icon(Iconsax.mobile), label: "Live"),
            NavigationDestination(icon: Icon(Iconsax.book), label: "Homework"),
            NavigationDestination(icon: Icon(Iconsax.wallet_money), label: "Fees"),
          ],
        ),
      ),
    );
  }
}

class NavigationController extends GetxController {
  final selectedIndex = 0.obs; // Rx variable for bottom nav
  final pageController = PageController(); // PageView controller

  final screens = [
    DashboardScreen(),
    LiveScreen(),
    HomeworkScreen(),
    FeesScreen(),
  ];

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}*/
