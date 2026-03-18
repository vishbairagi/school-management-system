import 'package:flutter/material.dart';
import 'package:school_management/constant/colors.dart';


class HRSmallButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;

  const HRSmallButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.backgroundColor = appColor, // Default to red if not specified
    this.textColor = whiteColor,     // Default to white if not specified
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
      ),
      child: Text(
        label,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
