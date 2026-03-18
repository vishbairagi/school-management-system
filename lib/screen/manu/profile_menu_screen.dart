import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:school_management/authentication/home/home_provider.dart';
import 'package:school_management/constant/colors.dart';
import 'package:school_management/constant/sizes.dart';
import 'package:school_management/screen/profile/profile_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../login/login_screen.dart';
import '../admitcard/admitcard.dart';
import '../attendance/attendence.dart';
import '../classtimetable/classtimetable.dart';
import '../event/event.dart';
import '../examtimetable/examtimetable.dart';
import '../leaverequest/leaverequest.dart';
import '../overalllresult/overallresult.dart';
import '../studymaterial/studymaterial.dart';

class ProfileDrawer extends StatelessWidget {
  const ProfileDrawer({super.key});

  @override
  Widget build(BuildContext context) {

    final dashboardProvider = Provider.of<DashboardProvider>(context);
    final student = dashboardProvider.homeModel.data?.student;

    return Drawer(
      width: MediaQuery.of(context).size.width * 0.80,
      backgroundColor: greyColor,

      child: ListView(
        padding: EdgeInsets.zero,
        children: [

          /// PROFILE HEADER
          Container(
            padding: const EdgeInsets.symmetric(vertical: 40),
            decoration: const BoxDecoration(
             color: appColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
              ),
            ),

            child: Column(
              children: [

                /// PROFILE IMAGE
                /// PROFILE IMAGE
                CircleAvatar(
                  radius: 45,
                  backgroundColor: whiteColor,
                  child: ClipOval(
                    child: student?.photo != null && student!.photo!.isNotEmpty
                        ? Image.network(
                      // If using emulator, replace localhost with 10.0.2.2
                      student.photo!.replaceAll("localhost", "192.168.1.40"),
                      width: 84,
                      height: 84,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.person, size: 40, color: Colors.grey);
                      },
                    )
                        : const Icon(Icons.person, size: 40, color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 15),

                /// STUDENT NAME
                Text(
                  student?.name ?? "Student Name",
                  style: const TextStyle(
                    color: whiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 5),

                /// EMAIL
                Text(
                  student?.school?.email ?? "student@gmail.com",
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                )
              ],
            ),
          ),

          const SizedBox(height: 20),

          MenuCardWidget(
            icon: Icons.school,
            title: "My Profile",
            onTap: () {
              Get.to(ProfileScreen());
            },
          ),

          MenuCardWidget(
            icon: Icons.grid_view,
            title: "Class Timetable",
            onTap: () {
              Get.to( ClassTimeTableScreen());
            },
          ),

          MenuCardWidget(
            icon: Icons.calendar_month,
            title: "Exam Timetable",
            onTap: () {
              Get.to(ExamtimetableScreen2());
            },
          ),

          MenuCardWidget(
            icon: Icons.workspace_premium,
            title: "Exam Result",
            onTap: () {
              Get.to(OverallResultScreen());
            },
          ),

          MenuCardWidget(
            icon: Icons.person,
            title: "Attendance",
            onTap: () {
              Get.to(AttendanceScreen());
            },
          ),

          MenuCardWidget(
            icon: Icons.event_busy,
            title: "Leave",
            onTap: () {
              Get.to(LeaveRequestScreen());
            },
          ),

          MenuCardWidget(
            icon: Icons.badge,
            title: "Admit Card",
            onTap: () {
              Get.to(AdmitcardScreen());
            },
          ),
          MenuCardWidget(
            icon: Icons.book,
            title: "Study Material",
            onTap: () {
              Get.to(StudyMaterialScreen());
            },
          ),
          MenuCardWidget(
            icon: Icons.event,
            title: "Event",
            onTap: () {
              Get.to(EventScreen());
            },
          ),

          GestureDetector(
            onTap: () async {
              // 1. Clear all shared preferences
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.clear();

              // 2. Show logout toast
              Fluttertoast.showToast(
                msg: "Logged out successfully",
                backgroundColor: Colors.black87,
                textColor: Colors.white,
              );

              // 3. Navigate to LoginScreen and remove all previous screens
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => const LoginScreen()),
                    (route) => false,
              );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: HRSizes.spaceBtwItems),
              padding: const EdgeInsets.all(3),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xC9C6ADAD),
                borderRadius: BorderRadius.circular(HRSizes.cardRadiusLg),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.black12,
                    offset: Offset(0, 3),
                  )
                ],
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.logout,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: HRSizes.md),
                  const Expanded(
                    child: Text(
                      "Logout",
                      style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          )        ],
      ),
    );
  }
}

class MenuCardWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const MenuCardWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,

      child: Container(
        margin: const EdgeInsets.only(bottom: HRSizes.spaceBtwItems),
        padding: const EdgeInsets.all(5),
        width: 30,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(HRSizes.cardRadiusLg),
          boxShadow: const [
            BoxShadow(
              blurRadius: 10,
              color: Colors.black12,
              offset: Offset(0,3),
            )
          ],
        ),

        child: Row(
          children: [

            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: appColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
              ),

              child: Icon(
                icon,
                color: appColor,
                size: 24,
              ),
            ),

            const SizedBox(width: HRSizes.md),

            Expanded(
              child: Text(
                title,
                style: textTheme.titleMedium,
              ),
            ),

            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}