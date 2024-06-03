import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CountryAirports extends StatefulWidget {
  final String countryCode;

  const CountryAirports({super.key, required this.countryCode});

  @override
  _CountryAirportsState createState() => _CountryAirportsState();
}

class _CountryAirportsState extends State<CountryAirports> {
  late Future<List<Airport>> _airports;

  @override
  void initState() {
    super.initState();
    _airports = fetchAirports(widget.countryCode);
  }

  Future<List<Airport>> fetchAirports(String countryCode) async {
    const apiKey = 'AIzaSyC5cgeX5IMFRn72hDbCQSCRF_qPMaItw1g';
    final response = await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/place/textsearch/json?query=airports+in+$countryCode&key=$apiKey'));

    if (response.statusCode == 200) {
      // log(response.body);
      final jsonResponse = json.decode(response.body);
      final List<dynamic> results = jsonResponse['results'];
      return results.map((data) => Airport.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load airports');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Airports in ${widget.countryCode}'),
      ),
      body: FutureBuilder<List<Airport>>(
        future: _airports,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No airports found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return AirportListItem(airport: snapshot.data![index]);
              },
            );
          }
        },
      ),
    );
  }
}

class Airport {
  final String name;
  final String city;

  Airport({required this.name, required this.city});

  factory Airport.fromJson(Map<String, dynamic> json) {
    return Airport(
      name: json['name'],
      city: json['formatted_address'],
    );
  }
}

class AirportListItem extends StatelessWidget {
  final Airport airport;

  const AirportListItem({super.key, required this.airport});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        airport.name,
        style: const TextStyle(
          color: Colors.teal,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        airport.city,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
      ),
      trailing: Card(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            airport.name.substring(1,4).toUpperCase(),
            style: const TextStyle(
              color: Colors.teal,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      
    );

    // Card(
    //   margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    //   child: Padding(
    //     padding: const EdgeInsets.all(16),
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [

    //         Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Text(
    //               airport.name,
    //               style: const TextStyle(
    //                 color: Colors.teal,
    //                 fontSize: 18,
    //                 fontWeight: FontWeight.bold,
    //               ),
    //             ),
    //             const SizedBox(height: 4),
    //             Text(
    //               airport.city,
    //               style: const TextStyle(
    //                 color: Colors.teal,
    //                 fontSize: 16,
    //               ),
    //             ),
    //           ],
    //         ),
    //         ElevatedButton(
    //           onPressed: () {
    //             // Handle the add button press here
    //           },
    //           child: const Text('ADD'),
    //         ),

    //       ],
    //     ),
    //   ),
    // );
  }
}
