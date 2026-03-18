import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_management/authentication/classtimetable/classtimetable_provider.dart';
import 'package:school_management/constant/colors.dart';

class ClassTimeTableScreen extends StatefulWidget {
  const ClassTimeTableScreen({super.key});

  @override
  State<ClassTimeTableScreen> createState() => _ClassTimeTableScreenState();
}

class _ClassTimeTableScreenState extends State<ClassTimeTableScreen> {

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      Provider.of<ClasstimetableProvider>(context, listen: false).home();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Class Time Table",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: appColor,
      ),

      body: Consumer<ClasstimetableProvider>(
        builder: (context, provider, child) {

          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          var timetable =
              provider.timetableModel.data?.classTimeTable?.classTimeTableData;

          if (timetable == null || timetable.isEmpty) {
            return const Center(child: Text("No timetable available"));
          }

          return ListView.builder(
            itemCount: timetable.length,
            padding: const EdgeInsets.all(12),
            itemBuilder: (context, index) {

              var dayData = timetable[index];

              return Card(
                elevation: 4,
                margin: const EdgeInsets.only(bottom: 15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),

                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      /// Day Title
                      Text(
                        dayData.day ?? "",
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),

                      const SizedBox(height: 10),

                      /// Routine List
                      if (dayData.routines != null &&
                          dayData.routines!.isNotEmpty)

                        ...dayData.routines!.map((routine) {

                          return Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(10)),

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text(
                                  routine.subject ?? "",
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),

                                const SizedBox(height: 5),

                                Text(
                                  "Time: ${routine.startTime} - ${routine.endTime}",
                                ),

                                Text(
                                  "Room: ${routine.room}",
                                ),

                                Text(
                                  "Teacher: ${routine.teacherName}",
                                ),
                              ],
                            ),
                          );

                        }).toList()

                      else
                        const Text("No classes"),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}