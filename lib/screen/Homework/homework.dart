import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_management/authentication/HomeWorks/homeworks_provider.dart';
import 'package:school_management/authentication/models/HomeWork/homework_model.dart';

import '../../common_widgets/common_top_appbar.dart';
import '../../constant/colors.dart';
import '../../constant/sizes.dart';
import '../../constant/themes/text_themes.dart';
import '../manu/profile_menu_screen.dart';


class HomeworkScreen extends StatefulWidget {
  const HomeworkScreen({super.key});

  @override
  State<HomeworkScreen> createState() => _HomeworkScreenState();
}

class _HomeworkScreenState extends State<HomeworkScreen> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeworksProvider>(context, listen: false).home();
    });
  }

  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<HomeworksProvider>(context);
    final textTheme = TTextTheme.lightTextTheme;

    final homeworkList =
        provider.homeworkModel.data?.homeworks?.homeworksData ?? [];

    return Scaffold(

      backgroundColor: whiteColor,

      appBar: const CommonTopAppBar(
        title: "HomeWork",
      ),
      drawer: const ProfileDrawer(),   // Drawer yaha add hota hai


      body: provider.isLoading
          ? const Center(
        child: CircularProgressIndicator(),
      )

          : homeworkList.isEmpty

      /// Empty State
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Icon(
              Icons.assignment_outlined,
              size: HRSizes.iconLg,
              color: greyColor,
            ),

            const SizedBox(height: HRSizes.sm),

            Text(
              "No homework available",
              style: textTheme.bodyMedium,
            ),
          ],
        ),
      )

      /// Homework List
          : ListView.builder(
        padding: const EdgeInsets.all(HRSizes.md),
        itemCount: homeworkList.length,
        itemBuilder: (context, index) {

          final homework = homeworkList[index];

          return Card(

            elevation: HRSizes.cardElevation,

            margin: const EdgeInsets.only(
                bottom: HRSizes.spaceBtwItems),

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  HRSizes.cardRadiusMd),
            ),

            child: Padding(
              padding: const EdgeInsets.all(HRSizes.md),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  /// Title
                  Text(
                    homework.title ?? "No Title",
                    style: textTheme.titleMedium,
                  ),

                  const SizedBox(height: HRSizes.sm),

                  /// Dates Row
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [

                      if (homework.date != null)
                        Text(
                          "Assigned: ${homework.date}",
                          style: textTheme.bodySmall,
                        ),

                      if (homework.dueDate != null)
                        Text(
                          "Due: ${homework.dueDate}",
                          style: textTheme.bodySmall
                              ?.copyWith(color: redColor),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}