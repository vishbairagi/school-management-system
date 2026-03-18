import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_management/authentication/LiveClasses/live_provider.dart';

import '../../common_widgets/common_top_appbar.dart';
import '../../constant/colors.dart';
import '../../constant/sizes.dart';
import '../../constant/themes/text_themes.dart';
import '../manu/profile_menu_screen.dart';



class LiveScreen extends StatelessWidget {
  const LiveScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<LiveProvider>(context);
    final textTheme = TTextTheme.lightTextTheme;

    final liveClasses = provider.liveModel.data?.liveClasses?.data ?? [];

    return Scaffold(
      backgroundColor: whiteColor,
      drawer: const ProfileDrawer(),   // Drawer yaha add hota hai

      appBar: const CommonTopAppBar(
        title: "Live Classes",
      ),


      body: provider.isLoading
          ? const Center(
        child: CircularProgressIndicator(),
      )

          : liveClasses.isEmpty

      /// Empty State
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Icon(
              Icons.live_tv_outlined,
              size: HRSizes.iconLg,
              color: greyColor,
            ),

            const SizedBox(height: HRSizes.sm),

            Text(
              "No live classes available",
              style: textTheme.bodyMedium,
            ),
          ],
        ),
      )

      /// Live Classes List
          : ListView.builder(
        padding: const EdgeInsets.all(HRSizes.md),
        itemCount: liveClasses.length,
        itemBuilder: (context, index) {

          final liveClass = liveClasses[index];

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

              child: Row(
                children: [

                  /// Left Content
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [

                        /// Title
                        Text(
                          liveClass.title ?? "No Title",
                          style: textTheme.titleMedium,
                        ),

                        const SizedBox(
                            height: HRSizes.sm),

                        /// Date
                        if (liveClass.date != null)
                          Text(
                            "Date: ${liveClass.date}",
                            style: textTheme.bodySmall,
                          ),

                        /// Time
                        if (liveClass.time != null)
                          Text(
                            "Time: ${liveClass.time}",
                            style: textTheme.bodySmall,
                          ),
                      ],
                    ),
                  ),

                  /// Play Button
                  IconButton(
                    icon: const Icon(
                      Icons.play_circle_fill,
                      size: HRSizes.iconLg,
                      color: appColor,
                    ),
                    onPressed: () {

                      if (liveClass.link != null) {

                        print("Open link: ${liveClass.link}");

                      }
                    },
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