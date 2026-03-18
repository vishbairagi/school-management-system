import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_management/authentication/home/home_provider.dart';
import 'package:school_management/constant/colors.dart';
import 'package:school_management/constant/sizes.dart';

import '../../common_widgets/common_top_appbar.dart';
import '../../constant/themes/text_themes.dart';
import '../manu/profile_menu_screen.dart';
import 'widgets/activity_list.dart';
import 'widgets/attendance_row.dart';
import 'widgets/profile_row.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<DashboardProvider>(context, listen: false).home();
    });
  }

  @override
  Widget build(BuildContext context) {

    final dashboardProvider = Provider.of<DashboardProvider>(context);
    final textTheme = TTextTheme.lightTextTheme;


    return Scaffold(
      drawer: const ProfileDrawer(),   // Drawer yaha add hota hai
      backgroundColor: greyColor,
      appBar:CommonTopAppBar(
        title: "School Management",
        onMenuTap: () {
          Scaffold.of(context).openDrawer();
        },
        onNotificationTap: () {
          print("Notification clicked");
        },
      ),

      body: dashboardProvider.isLoading
          ? const Center(
        child: CircularProgressIndicator(
          color: appColor,
        ),
      )

          : SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: HRSizes.md,
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                    height: HRSizes.spaceBtwItems),
                Text(
                  "Profile Details",
                  style: textTheme.titleLarge?.copyWith(
                    fontSize:20, // increase the size
                    fontWeight: FontWeight.bold,
                  ),
                ),

                /// Profile Section
                ProfileRow(
                  studentName:
                  dashboardProvider.homeModel.data?.student?.name ?? " ",
                  studentClass:
                  dashboardProvider.homeModel.data?.student?.studentClass ?? " ",
                  studentSection:
                  dashboardProvider.homeModel.data?.student?.section ?? " ",
                  studentPhoto:
                  dashboardProvider.homeModel.data?.student?.photo ?? " ",
                ),

                const SizedBox(
                    height: HRSizes.spaceBtwItems),
            Text(
              "Your Analytics",
              style: textTheme.titleLarge?.copyWith(
                fontSize:20, // increase the size
                fontWeight: FontWeight.bold,
              ),),
                const SizedBox(
                    height: HRSizes.spaceBtwItems),

                /// Attendance Section
                AttendanceGrid(
                  totalDays: dashboardProvider
                      .homeModel
                      .data
                      ?.attendance
                      ?.totalAttendance
                      ?.toString() ??
                      '0',

                  present: dashboardProvider
                      .homeModel
                      .data
                      ?.attendance
                      ?.totalPresent
                      ?.toString() ??
                      '0',

                  absent: dashboardProvider
                      .homeModel
                      .data
                      ?.attendance
                      ?.totalAbsent
                      ?.toString() ??
                      '0',

                  percent: dashboardProvider
                      .homeModel
                      .data
                      ?.attendance
                      ?.percentageText ??
                      '0%',
                ),

                const SizedBox(
                    height: HRSizes.spaceBtwItems),

                /// Notices Title
            Text(
              "Notice Board",
              style: textTheme.titleLarge?.copyWith(
                fontSize:20, // increase the size
                fontWeight: FontWeight.bold,
              ),),

                const SizedBox(height: HRSizes.sm),

                /// Notice List
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: dashboardProvider
                      .homeModel.data?.noticebord?.data?.length ??
                      0,
                  itemBuilder: (context, index) {

                    final notice = dashboardProvider
                        .homeModel.data!.noticebord!.data![index];

                    return Padding(
                      padding: const EdgeInsets.only(
                          bottom: HRSizes.sm),
                      child: ActivityCard(
                        title: notice.title,
                        date: notice.date,
                        link: notice.link,
                        description: notice.description,
                      ),
                    );
                  },
                ),

                const SizedBox(height: HRSizes.spaceBtwItems),
              ],
            ),
          ),
        ),
      ),
    );
  }
}