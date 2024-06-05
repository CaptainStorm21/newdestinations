import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
// import 'package:flutter_spinkit/flutter_spinkit.dart';

class CountryAirports extends StatefulWidget {
  const CountryAirports({super.key, required String countryCode});

  @override
  // ignore: library_private_types_in_public_api
  _CountryAirportsState createState() => _CountryAirportsState();
}

class _CountryAirportsState extends State<CountryAirports> {
  List<dynamic> airports = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchAirports();
  }

  FutureOr<void> fetchAirports() async {
    const apiKey = 'AIzaSyC5cgeX5IMFRn72hDbCQSCRF_qPMaItw1g';
    const url =
        'https://maps.googleapis.com/maps/api/place/textsearch/json?query=airports+in+Scotland&key=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        airports = data['results'];
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load airports');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Major Airports in Scotland'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: airports.length,
              itemBuilder: (context, index) {
                final airport = airports[index];
                return Column(
                  children: [
                    ListTile(
                      title: Text(airport['name']),
                      subtitle: Text(airport['formatted_address']),
                    ),
                    Divider(),
                  ],
                );
              },
            ),
    );
  }
}
