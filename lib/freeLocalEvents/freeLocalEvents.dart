import 'dart:convert';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class FreeLocalEvents extends StatefulWidget {
  const FreeLocalEvents({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FreeLocalEventsState createState() => _FreeLocalEventsState();
}

class _FreeLocalEventsState extends State<FreeLocalEvents> {
  List<dynamic> events = [];
  late DateTime currentDate;

  @override
  void initState() {
    super.initState();
    loadEventData();
    currentDate = DateTime.now();
  }

  FutureOr<void> loadEventData() async {
    final String response = await rootBundle.loadString('assets/data/freeEvents.json');
    final data = await json.decode(response);
    setState(() {
      events = data;
      // Sort events by date
      events.sort((a, b) {
        DateTime dateA = DateTime.parse(a['date']);
        DateTime dateB = DateTime.parse(b['date']);
        return dateA.compareTo(dateB);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'Free Events Nearby',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: events.length,
            itemBuilder: (context, index) {
              DateTime date = DateTime.parse(events[index]['date']);
              if (date.isBefore(currentDate)) {
                // Event date has passed, hide the entire event
                return SizedBox.shrink();
              }
              String formattedDate = DateFormat('MMMM d, yyyy').format(date);

              return Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFCDC2A2), width: 2),
                  borderRadius: BorderRadius.circular(4),
                ),
                margin: const EdgeInsets.all(5.0),
                child: Card(
                  child: Container(
                    width: 200,
                    height: 200,
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          events[index]['event_photo'] ?? '',
                          height: 100,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Icon(Icons.image_not_supported),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          formattedDate,
                          style: const TextStyle(fontSize: 12),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          events[index]['event_description'] ?? '',
                          style: const TextStyle(fontSize: 12),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          events[index]['address']['city'] ?? '',
                          style: const TextStyle(fontSize: 12),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          events[index]['price'] == 0.00 ? "Free" : "\$${events[index]['price']}",
                          style: const TextStyle(fontSize: 12, color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
