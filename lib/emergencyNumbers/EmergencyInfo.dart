import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle; // Import rootBundle

class EmergencyInfo extends StatefulWidget {
  const EmergencyInfo({super.key});

  @override
  _EmergencyInfoState createState() => _EmergencyInfoState();
}

class _EmergencyInfoState extends State<EmergencyInfo> {
  Map<String, dynamic> scotlandEmergencyData = {};

  @override
  void initState() {
    super.initState();
    _loadEmergencyData();
  }

  Future<void> _loadEmergencyData() async {
    // Load JSON data from assets
    String jsonString = await rootBundle.loadString('assets/data/emergencyNumbers.json');
    setState(() {
      // Parse JSON data
      scotlandEmergencyData = json.decode(jsonString);
    });
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> emergencyNumbers = scotlandEmergencyData['Scotland'] != null
        ? scotlandEmergencyData['Scotland']['emergency_numbers']
        : {};
    Map<String, dynamic> nonEmergencyNumbers = scotlandEmergencyData['Scotland'] != null
        ? scotlandEmergencyData['Scotland']['non_emergency_numbers']
        : {};

    return Scaffold(
      body: scotlandEmergencyData.isEmpty
          ? const Center(child: CircularProgressIndicator()) // Show loading indicator while data is loading
          : ListView(
              children: [
                const ListTile(
                  title: Text('Emergency Numbers', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                for (var entry in emergencyNumbers.entries)
                  ListTile(
                    title: Text(entry.key),
                    subtitle: Text(entry.value.toString()),
                  ),
                const ListTile(
                  title: Text('Non-Emergency Numbers', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                for (var entry in nonEmergencyNumbers.entries)
                  ListTile(
                    title: Text(entry.key),
                    subtitle: Text(entry.value.toString()),
                  ),
              ],
            ),
    );
  }
}