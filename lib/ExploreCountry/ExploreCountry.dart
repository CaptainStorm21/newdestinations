import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newdestinations/SearchfarDestination/SearchBarDestination.dart';
import 'package:newdestinations/currencyExchange/CurrencyExchange.dart';
import 'dart:convert';

import 'package:newdestinations/reusableElements/CountryCityBeltTemplate/country_city_belt_template.dart';

class ExploreCountry extends StatefulWidget {
  const ExploreCountry({Key? key}) : super(key: key);

  @override
  _ExploreCountryState createState() => _ExploreCountryState();
}

class _ExploreCountryState extends State<ExploreCountry> {
  String countryImageUrl = '';

  @override
  void initState() {
    super.initState();
    fetchCountryImage('Scotland'); // Fetch image for Scotland as an example
  }

  Future<void> fetchCountryImage(String countryName) async {
    // Replace with your Google Places API key and endpoint
const String apiKey = 'AIzaSyCsDn8FS6C9tpS9zaOgNMcxXbMp4zfwwcA';
    String endpoint =
        'https://maps.googleapis.com/maps/api/place/findplacefromtext/json';

    // Example request to find a place (in this case, country) using Google Places API
    var response = await http.get(Uri.parse(
        '$endpoint?input=$countryName&inputtype=textquery&key=$apiKey'));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      if (data['candidates'].isNotEmpty) {
        String placeId = data['candidates'][0]['place_id'];
        await fetchCountryPhoto(placeId);
      }
    } else {
      throw Exception('Failed to load country image');
    }
  }

  Future<void> fetchCountryPhoto(String placeId) async {
    // Implement logic to fetch country photo based on placeId
    // Example: countryImageUrl = 'https://example.com/images/$placeId.jpg';
    // setState(() {
    //   countryImageUrl = 'https://example.com/images/$placeId.jpg';
    // });
  }

  @override
  Widget build(BuildContext context) {
    String country = "Scotland";
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore $country'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(height: 10),
            const SeachbarDestination(),
            const SizedBox(height: 20), // Example spacing
            // Container with fixed height and width 100%
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 300,
                child: Image.network(
                  'https://wallpapercave.com/wp/wp1815130.jpg',
                  fit: BoxFit.cover,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    }
                  },
                ),
              ),
            ),

            const SizedBox(height: 20), // Adding space below the image

            // Adding the requested row
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      //CountryCityBeltTemplate(),
                    ],
                  )
                ],
              ),
            ),
            
            // End of the requested row
            
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 100,
                      color: Colors.lightBlue,
                      child: 
                        const  CurrencyExchange(country: 'Scotland'),
                      
                    ),
                  ),
                  const SizedBox(width: 10), // Added padding between the two cells
                  Expanded(
                    child: Container(
                      height: 100,
                      color: Colors.yellow,
                      child: const Center(child: Text('Column 2')),
                    ),
                  ),
                ],
              ),
            ),
            
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}
