import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AirportWidget extends StatefulWidget {
  const AirportWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AirportWidgetState createState() => _AirportWidgetState();
}

class _AirportWidgetState extends State<AirportWidget> {
  List<String> airportCodes = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchAirportData();
  }

  Future<void> fetchAirportData() async {
    const apiKey = 'AIzaSyC5cgeX5IMFRn72hDbCQSCRF_qPMaItw1g'; // Replace with your API key
    const url =
        'https://maps.googleapis.com/maps/api/place/textsearch/json?query=airports+in+Scotland&key=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final results = data['results'];

      setState(() {
        airportCodes = results.map<String>((airport) => airport['iata_code']).toList();
        isLoading = false;
      });

      // Print the airport codes to the console
      print('Airport Codes: $airportCodes');
    } else {
      throw Exception('Failed to load airport data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Airports in Scotland'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: airportCodes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    airportCodes[index],
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            ),
    );
  }
}