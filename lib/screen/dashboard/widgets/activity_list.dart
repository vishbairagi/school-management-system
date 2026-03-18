import 'package:flutter/material.dart';
import 'package:school_management/constant/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class ActivityCard extends StatefulWidget {
  final String? title;
  final String? date;
  final String? link;
  final String? description;

  const ActivityCard({
    Key? key,
    this.title,
    this.date,
    this.link,
    this.description,
  }) : super(key: key);

  @override
  State<ActivityCard> createState() => _ActivityCardState();
}

class _ActivityCardState extends State<ActivityCard> {
  bool isExpanded = false;

  /// Function to safely open the URL
  void _openLink(String url) async {
    if (url.isEmpty || url == '#' || !url.startsWith("http")) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid URL format. Include http:// or https://')),
      );
      return;
    }

    final uri = Uri.parse(url); // use parse, not tryParse for validated url
    try {
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        throw 'Could not launch $url';
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 2),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Row(
        children: [
          /// Left Purple Border
          Container(
            width: 5,
            height: isExpanded ? 180 : 70,
            decoration: BoxDecoration(
              color: appColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Title Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.title ?? "",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isExpanded = !isExpanded;
                          });
                        },
                        child: Icon(
                          isExpanded
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),

                  /// Expanded Section
                  if (isExpanded) ...[
                    const SizedBox(height: 12),

                    /// Date Row
                    if (widget.date != null && widget.date!.isNotEmpty)
                      Row(
                        children: [
                          const Icon(Icons.calendar_today,
                              size: 18, color: Colors.grey),
                          const SizedBox(width: 8),
                          Text(
                            widget.date!,
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),

                    const SizedBox(height: 8),

                    /// Description
                    if (widget.description != null &&
                        widget.description!.isNotEmpty)
                      Text(
                        widget.description!,
                        style: const TextStyle(color: Colors.black87),
                      ),

                    const SizedBox(height: 12),

                    /// Link Row (open if valid and not '#')
                    if (widget.link != null &&
                        widget.link!.isNotEmpty &&
                        widget.link! != '#')
                      Row(
                        children: [
                          const Icon(Icons.link, size: 18, color: Colors.blue),
                          const SizedBox(width: 8),
                          GestureDetector(
                            onTap: () {
                              _openLink(widget.link!);
                            },
                            child:  Text(
                              widget.link!,  // <-- shows the actual link

                              style: TextStyle(
                                color: Colors.blue,
                              //  decoration: TextDecoration.underline,
                              ),
                            ),
                          )
                        ],
                      ),
                  ]
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}