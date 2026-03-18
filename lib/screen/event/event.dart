import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:school_management/constant/colors.dart';
import '../../authentication/event/event_provider.dart';
import '../../authentication/models/event/event_model.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch events when screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<EventProvider>(context, listen: false).home();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Events",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: appColor,
      ),
      body: Consumer<EventProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final events = provider.eventsModel.data?.events?.eventsData ?? [];

          if (events.isEmpty) {
            return const Center(child: Text("No events found."));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: events.length,
            itemBuilder: (context, index) {
              EventData event = events[index];

              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min, // only take required height
                    children: [
                      Text(
                        event.title ?? '-',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        event.description ?? '-',
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Event Date: ${event.eventDate ?? '-'}",
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 12),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                            event.hasJoined == true ? redColor : whiteColor,
                          ),
                          onPressed: () {
                            // Toggle join state locally
                            setState(() {
                              event.hasJoined = !(event.hasJoined ?? false);
                            });

                            // Optionally: Call API to update join status here
                            Fluttertoast.showToast(
                                msg: event.hasJoined == true
                                    ? "Joined Event"
                                    : "Un-Joined Event",
                                backgroundColor: Colors.black87,
                                textColor: Colors.white);
                          },
                          child: Text(event.hasJoined == true ? "Un-Join" : "Join"),
                        ),
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