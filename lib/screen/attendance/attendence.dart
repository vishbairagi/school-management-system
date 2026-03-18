import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_management/constant/colors.dart';

import '../../authentication/attandence/attendence_provider.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<AttendenceProvider>(context, listen: false).home();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Attendance",style: TextStyle(color: Colors.white),),
        backgroundColor: appColor,
        centerTitle: true,
      ),

      body: Consumer<AttendenceProvider>(
        builder: (context, provider, child) {

          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final overall =
              provider.attendanceModel.data?.attendance?.overall;

          final monthly =
              provider.attendanceModel.data?.attendance?.monthly ?? [];

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [

                /// ---------------- Overall Card ----------------
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [

                        const Text(
                          "Overall Attendance",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),

                        const SizedBox(height: 15),

                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceAround,
                          children: [

                            _buildItem(
                                "Total",
                                overall?.totalAttendance
                                    .toString() ??
                                    "0"),

                            _buildItem(
                                "Present",
                                overall?.totalPresent.toString() ??
                                    "0"),

                            _buildItem(
                                "Absent",
                                overall?.totalAbsent.toString() ??
                                    "0"),
                          ],
                        ),

                        const SizedBox(height: 15),

                        Text(
                          "Attendance: ${overall?.percentageText ?? "0%"}",
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.green),
                        )
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                /// ---------------- Monthly Cards ----------------
                ListView.builder(
                  itemCount: monthly.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {

                    final data = monthly[index];

                    return Card(
                      elevation: 3,
                      margin: const EdgeInsets.only(bottom: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [

                            Text(
                              data.month ?? "",
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight:
                                  FontWeight.bold),
                            ),

                            const SizedBox(height: 10),

                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween,
                              children: [

                                _buildItem(
                                    "Total",
                                    data.totalAttendance ??
                                        "0"),

                                _buildItem(
                                    "Present",
                                    data.totalPresent ??
                                        "0"),

                                _buildItem(
                                    "Absent",
                                    data.totalAbsent ??
                                        "0"),
                              ],
                            ),

                            const SizedBox(height: 10),

                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween,
                              children: [

                                _buildItem(
                                    "Holiday",
                                    data.totalHolidays ??
                                        "0"),

                                _buildItem(
                                    "Late",
                                    data.totalLate ?? "0"),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildItem(String title, String value) {
    return Column(
      children: [

        Text(
          value,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 5),

        Text(
          title,
          style: const TextStyle(color: Colors.grey),
        )
      ],
    );
  }
}