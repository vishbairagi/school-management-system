import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_management/authentication/noticeboard/noticeboard_provider.dart';
import 'package:school_management/constant/colors.dart';
import 'package:school_management/constant/sizes.dart';

class NoticeBoardScreen extends StatefulWidget {
  const NoticeBoardScreen({super.key});

  @override
  State<NoticeBoardScreen> createState() => _NoticeBoardScreenState();
}

class _NoticeBoardScreenState extends State<NoticeBoardScreen> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<NoticeboardProvider>(context, listen: false).home();
    });
  }

  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<NoticeboardProvider>(context);

    final notices =
        provider.noticeModel.data?.noticeboard?.data ?? [];

    final textTheme = Theme.of(context).textTheme;

    return Scaffold(

      appBar: AppBar(
        title: Text(
          "Notice Board",
          style: textTheme.headlineSmall?.copyWith(
            color: whiteColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: appColor,
      ),

      backgroundColor: greyColor,

      body: provider.isLoading
          ? const Center(
        child: CircularProgressIndicator(color: appColor),
      )

          : notices.isEmpty
          ? Center(
        child: Text(
          "No notices available",
          style: textTheme.bodyLarge,
        ),
      )

          : ListView.builder(
        padding: const EdgeInsets.all(HRSizes.md),
        itemCount: notices.length,
        itemBuilder: (context, index) {

          final notice = notices[index];

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
                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  /// Title
                  Text(
                    notice.title ?? "",
                    style: textTheme.titleLarge,
                  ),

                  const SizedBox(height: HRSizes.sm),

                  /// Description
                  Text(
                    notice.description ?? "",
                    style: textTheme.bodyMedium,
                  ),

                  const SizedBox(height: HRSizes.sm),

                  /// Date
                  Text(
                    "Date: ${notice.date ?? ""}",
                    style: textTheme.labelMedium,
                  ),

                  const SizedBox(height: HRSizes.sm),

                  /// Link
                  if (notice.link != null &&
                      notice.link != "#")
                    InkWell(
                      onTap: () {
                        print("Open link: ${notice.link}");
                      },
                      child: Text(
                        "View More",
                        style: textTheme.labelLarge?.copyWith(
                          color: appColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
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