// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyInfo extends StatefulWidget {
  const EmergencyInfo({
    super.key,
    required this.emergencyNumbers,
    required this.nonEmergencyNumbers,
  });

  final Map<String, String> emergencyNumbers;
  final Map<String, String> nonEmergencyNumbers;

  @override
  // ignore: library_private_types_in_public_api
  _EmergencyInfoState createState() => _EmergencyInfoState();
}

class _EmergencyInfoState extends State<EmergencyInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.emergencyNumbers.isEmpty
          ? const Center(
              child:
                  CircularProgressIndicator()) // Show loading indicator while data is loading
          : ListView(
              children: [
                const ListTile(
                  title: Text('Emergency Numbers',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                for (var entry in widget.emergencyNumbers.entries)
                  ListTile(
                    title: Text(entry.key),
                    subtitle: GestureDetector(
                      onTap: () {
                        _launchCall(entry.value);
                      },
                      child: Text(entry.value),
                    ),
                  ),
                const ListTile(
                  title: Text('Non-Emergency Numbers',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                for (var entry in widget.nonEmergencyNumbers.entries)
                  ListTile(
                    title: Text(entry.key),
                    subtitle: GestureDetector(
                      onTap: () {
                        _launchCall(entry.value);
                      },
                      child: Text(entry.value),
                    ),
                  ),
              ],
            ),
    );
  }

  // Function to initiate a call
  void _launchCall(String phoneNumber) async {
    String url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
