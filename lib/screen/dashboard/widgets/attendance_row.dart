import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:school_management/constant/colors.dart';

class AttendanceGrid extends StatelessWidget {

  final String totalDays;
  final String present;
  final String absent;
  final String percent;

  const AttendanceGrid({
    super.key,
    required this.totalDays,
    required this.present,
    required this.absent,
    required this.percent,
  });

  Widget _card(String title, String value, IconData icon, Color color) {

    return Container(
      width: 80,
      padding: const EdgeInsets.all(10),

      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
          )
        ],
      ),

      child: Column(
        children: [

          Icon(icon, color: color),

          const SizedBox(height: 6),

          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),

          Text(
            title,
            textAlign: TextAlign.center,
          )

        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        _card("Total\nDays", totalDays, Icons.calendar_today, Colors.purple),


        _card("Present\nDays", present, Icons.person, Colors.green),

        _card("Absent\nDays", absent, Icons.person_off, Colors.red),

        _card("Percent\n%", percent, Icons.percent, Colors.blue),

      ],
    );
  }
}