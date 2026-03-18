import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_management/authentication/home/home_provider.dart';
import 'package:school_management/constant/colors.dart';
import 'package:school_management/constant/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<DashboardProvider>(context);
    final student = provider.homeModel.data?.student;
    final school = student?.school;

    return Scaffold(
      backgroundColor: greyColor,

      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(color: whiteColor),
        ),
        backgroundColor: appColor,
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Center(
              child: Text(
                "Edit",
                style: TextStyle(color: whiteColor,fontSize:16),
              ),
            ),
          )
        ],
      ),

      body: provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: const EdgeInsets.all(HRSizes.md),

        child: Column(
          children: [

            /// STUDENT CARD
            Container(
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.black12,
                    offset: Offset(0,3),
                  )
                ],
              ),

              child: Column(
                children: [

                  /// PHOTO
                  CircleAvatar(
                    radius: 46,
                    backgroundColor: whiteColor,
                    child: ClipOval(
                      child: student?.photo != null && student!.photo!.isNotEmpty
                          ? Image.network(
                        // Replace localhost for emulator
                        student.photo!.replaceAll("localhost", "192.168.1.40"),
                        width: 92,
                        height: 92,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.person, size: 40, color: Colors.grey);
                        },
                      )
                          : const Icon(Icons.person, size: 40, color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: 15),

                  /// NAME
                  Text(
                    student?.name ?? "",
                    style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                    ),
                  ),

                  const SizedBox(height: 5),

                  /// SESSION
                  Text(
                    student?.session ?? "",
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16
                    ),
                  ),

                  const SizedBox(height: 25),

                  profileRow(
                      "Class",
                      "${student?.studentClass ?? ""} ${student?.section ?? ""}"
                  ),

                  profileDivider(),

                  profileRow(
                      "Enrollment No",
                      student?.enrollmentNumber ?? ""
                  ),

                  profileDivider(),

                  profileRow(
                      "Roll No",
                      student?.rollNumber ?? ""
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// SCHOOL CARD
            Container(
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.black12,
                    offset: Offset(0,3),
                  )
                ],
              ),

              child: Column(
                children: [

                  profileRow(
                      "School",
                      school?.name ?? ""
                  ),

                  profileDivider(),

                  profileRow(
                      "Email",
                      school?.email ?? ""
                  ),

                  profileDivider(),

                  profileRow(
                      "Father",
                      student?.fatherName ?? "-"
                  ),

                  profileDivider(),

                  profileRow(
                      "Address",
                      school?.address ?? ""
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// PROFILE ROW WIDGET
Widget profileRow(String title,String value){

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12),

    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        SizedBox(
          width: 130,
          child: Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16
            ),
          ),
        ),

        Expanded(
          child: Text(
            value,
            style: const TextStyle(
                fontSize: 16
            ),
          ),
        ),
      ],
    ),
  );
}

/// DIVIDER
Widget profileDivider(){
  return const Divider(height: 1);
}