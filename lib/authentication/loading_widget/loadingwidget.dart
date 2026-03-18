

import 'package:flutter/material.dart';
import 'package:school_management/constant/colors.dart';


loadingWidget(context) {
  showDialog(
    context: context,
    builder: (context) {
      return const Center(
        child: CircularProgressIndicator(color: appColor),
      );
    },
  );
}