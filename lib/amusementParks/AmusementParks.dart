import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AmusementParks extends StatefulWidget {
  const AmusementParks({super.key});

  @override
  _AmusementParksState createState() => _AmusementParksState();
}

class _AmusementParksState extends State<AmusementParks> {
  List<dynamic> amusementParksData = [];

  @override
  void initState() {
    super.initState();
    fetchAmusementParks();
  }

  Future<void> fetchAmusementParks() async {
    final response = await http.get(
      Uri.parse('https://maps.googleapis.com/maps/api/place/textsearch/json?query=UNESCO+world+heritage+sites&key=YOUR_API_KEY_HERE'),
      headers: {
        'Authorization': 'YOUR_API_KEY_HERE',
      },
    );

    if (response.statusCode == 200) {
      setState(() {
        amusementParksData = json.decode(response.body)['results'];
      });
    } else {
      throw Exception('Failed to load amusement parks');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Amusement Parks'),
      ),
      body: ListView.builder(
        itemCount: amusementParksData.length,
        itemBuilder: (context, index) {
          var park = amusementParksData[index];
          return Card(
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(park['name']),
                  subtitle: Text(park['vicinity']),
                  leading: Image.network(
                    park['photos'] != null && park['photos'].isNotEmpty
                        ? 'YOUR_BASE_PHOTO_URL_HERE${park['photos'][0]['photo_reference']}'
                        : 'YOUR_DEFAULT_IMAGE_URL_HERE',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    park['description'] ?? 'Description not available',
                  ),
                ),
                ButtonBar(
                  children: <Widget>[
                    TextButton(
                      onPressed: () {
                        // Add to wishlist logic
                      },
                      child: const Text('Add to wishlist'),
                    ),
                    TextButton(
                      onPressed: () {
                        // Add to trip logic
                      },
                      child: const Text('Add to my trip'),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
