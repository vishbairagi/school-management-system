import 'package:flutter/material.dart';

class ProfileRow extends StatelessWidget {
  final String studentName;
  final String studentClass;
  final String studentSection;
  final String studentPhoto;

  const ProfileRow({
    Key? key,
    required this.studentName,
    required this.studentClass,
    required this.studentSection,
    required this.studentPhoto,
  }) : super(key: key);

  String getFixedPhotoUrl(String url) {
    if (url.isEmpty) return '';
    // Replace localhost with your computer IP for emulator/device
    if (url.contains('localhost')) {
      return url.replaceFirst('localhost', '192.168.1.40'); // Put your LAN IP here
    }
    return url;
  }

  @override
  Widget build(BuildContext context) {
    final photoUrl = getFixedPhotoUrl(studentPhoto);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal:1, vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Row(
        children: [

          /// Student Image
          CircleAvatar(
            radius: 35,
            backgroundColor: Colors.grey[200],
            child: photoUrl.isEmpty
                ? const Icon(Icons.person, size: 40, color: Colors.grey)
                : ClipOval(
              child: Image.network(
                photoUrl,
                width: 70,
                height: 70,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.person, size: 40, color: Colors.grey);
                },
              ),
            ),
          ),

          const SizedBox(width: 15),

          /// Student Details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// Name
              Text(
                studentName,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),

              const SizedBox(height: 5),

              /// Class
              Text(
                "Class: $studentClass",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey[600],
                ),
              ),

              /// Section
              Text(
                "Div: $studentSection",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey[600],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}