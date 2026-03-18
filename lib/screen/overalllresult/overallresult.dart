import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_management/authentication/overallresult/overallresult_provider.dart';
import 'package:school_management/constant/colors.dart';

class OverallResultScreen extends StatefulWidget {
  const OverallResultScreen({super.key});

  @override
  State<OverallResultScreen> createState() => _OverallResultScreenState();
}

class _OverallResultScreenState extends State<OverallResultScreen> {

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      Provider.of<OverallresultProvider>(context, listen: false).home();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: const Text(
          "Overall Result",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor:appColor,
      ),

      body: Consumer<OverallresultProvider>(
        builder: (context, provider, child) {

          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          var result = provider.resultModel.data?.result;
          var school = provider.resultModel.data?.student?.school;

          if (result == null) {
            return const Center(child: Text("No Data"));
          }

          double percentage =
              double.tryParse(result.overallPercentageValue ?? "0") ?? 0;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [

                /// SCHOOL CARD
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          school?.name ?? "",
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),

                        const SizedBox(height: 8),

                        Text(school?.address ?? ""),

                        const SizedBox(height: 8),

                        Row(
                          children: [
                            const Icon(Icons.phone, size: 18),
                            const SizedBox(width: 6),
                            Text(school?.phone ?? ""),
                          ],
                        ),

                        const SizedBox(height: 5),

                        Row(
                          children: [
                            const Icon(Icons.email, size: 18),
                            const SizedBox(width: 6),
                            Text(school?.email ?? ""),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                /// STUDENT DETAILS
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Student Details",
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),

                const SizedBox(height: 10),

                _row("Name", result.studentName),
                _row("Enrollment No", result.enrollmentNumber),
                _row("Class", result.studentClass),
                _row("Section", result.section),
                _row("Roll No", result.rollNumber),
                _row("Father Name", result.fatherName),
                _row("Father Phone", result.fatherPhone),
                _row("Session", result.session),

                const Divider(height: 30),

                /// PERCENTAGE CIRCLE
                SizedBox(
                  height: 200,
                  width: 200,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [

                      CircularProgressIndicator(
                        value: percentage / 100,
                        strokeWidth: 12,
                        backgroundColor: Colors.grey.shade300,
                        color: Colors.green,
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text(
                            "${percentage.toStringAsFixed(1)}%",
                            style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          ),

                          const Text("Passed"),
                        ],
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                /// OVERALL SUMMARY
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(

                      children: [

                        const Text(
                          "Overall Summary",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),

                        const Divider(),

                        _summaryRow(
                            "Total Marks",
                            result.overallMaximumMarks
                        ),

                        _summaryRow(
                            "Obtained Marks",
                            result.overallObtainedMarks
                        ),

                        _summaryRow(
                            "Percentage",
                            result.overallPercentageText
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  /// STUDENT ROW
  Widget _row(String title, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [

          Expanded(
            flex: 4,
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),

          Expanded(
            flex: 6,
            child: Text(value ?? "-"),
          ),
        ],
      ),
    );
  }

  /// SUMMARY ROW
  Widget _summaryRow(String title, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Text(title),

          Text(
            value ?? "",
            style: const TextStyle(
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}