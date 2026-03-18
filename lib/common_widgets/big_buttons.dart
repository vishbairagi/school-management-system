import 'package:flutter/material.dart';
import 'package:school_management/constant/colors.dart';
import 'package:school_management/constant/sizes.dart';




class HRBigButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color backgroundColor;

  HRBigButton({
    required this.onPressed,
    required this.text,
    this.backgroundColor = appColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        minimumSize: Size(HRSizes.screenWidth(context), 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(HRSizes.borderRadiusLg),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: HRSizes.md, color: whiteColor),
      ),
    );
  }
}
