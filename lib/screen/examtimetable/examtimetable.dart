import 'package:flutter/material.dart';
import 'package:school_management/constant/colors.dart';

class ExamtimetableScreen2 extends StatelessWidget {
  const ExamtimetableScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exam Time Table",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: appColor,
      ),
    );
  }
}
