import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_management/constant/colors.dart';

import '../../authentication/studymaterial/studymaterial_provider.dart';


class StudyMaterialScreen extends StatefulWidget {
  const StudyMaterialScreen({super.key});

  @override
  State<StudyMaterialScreen> createState() => _StudyMaterialScreenState();
}

class _StudyMaterialScreenState extends State<StudyMaterialScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch study material on screen load
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<StudymaterialProvider>(context, listen: false).home();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Study Material",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: appColor,
      ),
      body: Consumer<StudymaterialProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final studyMaterial = provider.studyMaterialModel.data?.studyMaterial;

          if (studyMaterial == null) {
            return const Center(child: Text("No study material found."));
          }

          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // <-- only take needed space

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      studyMaterial.title ?? '-',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      studyMaterial.description ?? '-',
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Date: ${studyMaterial.date ?? '-'}",
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: () {
                        if (studyMaterial.url != null) {
                          // Open URL in browser
                          // You can use url_launcher package
                        }
                      },
                      child: Text(
                        "Url: ${studyMaterial.url ?? '-'}",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.blue,
                          //decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}