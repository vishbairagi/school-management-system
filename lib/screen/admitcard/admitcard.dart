import 'package:flutter/material.dart';
import 'package:school_management/constant/colors.dart';

class AdmitcardScreen extends StatelessWidget {
  const AdmitcardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admit Card",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: appColor,
      ),

    );
  }
}
