import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_management/constant/colors.dart';

import '../../authentication/leaverequest/leaverequest_provider.dart';


class LeaveRequestScreen extends StatefulWidget {
  const LeaveRequestScreen({super.key});

  @override
  State<LeaveRequestScreen> createState() => _LeaveRequestScreenState();
}

class _LeaveRequestScreenState extends State<LeaveRequestScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch leave requests on screen load
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<LeaveRequestProvider>(context, listen: false).home();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Leave Requests",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: appColor,
      ),
      body: Consumer<LeaveRequestProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final leaves = provider.leaveModel.data?.leaves?.data;

          if (leaves == null || leaves.isEmpty) {
            return const Center(child: Text("No leave requests found."));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: leaves.length,
            itemBuilder: (context, index) {
              final leave = leaves[index];

              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Reason: ${leave.reason ?? '-'}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Date: ${leave.leaveDate ?? '-'}",
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Approval: ${leave.approval ?? '-'}",
                        style: TextStyle(
                            fontSize: 14,
                            color: leave.approval?.toLowerCase() == 'approved'
                                ? Colors.green
                                : leave.approval?.toLowerCase() == 'rejected'
                                ? Colors.red
                                : Colors.orange),
                      ),
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