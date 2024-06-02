import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class FreeLocalEvents extends StatefulWidget {
  const FreeLocalEvents({super.key});

  @override
  _FreeLocalEventsState createState() => _FreeLocalEventsState();
}

class _FreeLocalEventsState extends State<FreeLocalEvents> {
  List<dynamic> events = [];

  @override
  void initState() {
    super.initState();
    loadEventData();
  }

  Future<void> loadEventData() async {
    final String response = await rootBundle.loadString('assets/data/freeEvents.json');
    final data = await json.decode(response);
    setState(() {
      events = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20, // Adjust height to fit the card size and padding
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: events.length,
        itemBuilder: (context, index) {
          DateTime date = DateTime.parse(events[index]['date']); // Parse date string to DateTime
          String formattedDate = DateFormat('MMMM d, yyyy').format(date); // Format the date

          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFCDC2A2), width: 2), // Add border with color cdc2a2
              borderRadius: BorderRadius.circular(4), // Optional: add border radius
            ),
            margin: const EdgeInsets.all(5.0),
            child: Card(
              child: Container(
                width: 200,
                height: 100,
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      events[index]['event_photo'],
                      height: 200,
                      width: 180,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      formattedDate,
                      style: const TextStyle(fontSize: 12),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      events[index]['event_description'],
                      style: const TextStyle(fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      events[index]['address']['city'],
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
    );
  }
}