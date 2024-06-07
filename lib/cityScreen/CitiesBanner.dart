import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:math';

class CityBanner extends StatelessWidget {
  const CityBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: FutureBuilder<List<Widget>>(
        future: _buildCityCards(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView(
              scrollDirection: Axis.horizontal,
              children: snapshot.data ?? [],
            );
          }
        },
      ),
    );
  }

  Future<List<Map<String, dynamic>>> _loadCityData() async {
    final citiesData = await rootBundle.loadString('assets/data/citiesNearby.json');
    final decodedData = json.decode(citiesData);
    return List<Map<String, dynamic>>.from(decodedData['cities']);
  }

  Future<List<Widget>> _buildCityCards() async {
    final cities = (await _loadCityData()).cast<Map<String, dynamic>>();
    cities.shuffle();
    return cities.take(5).map((city) => _buildCityCard(city)).toList();
  }

  Widget _buildCityCard(Map<String, dynamic> city) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: GestureDetector(
        onTap: () {
          // Add your onTap action here
        },
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            side: const BorderSide(color: Color.fromARGB(255, 148, 146, 146), width: 1.0),
          ),
          child: SizedBox(
            height: 190,
            width: 220,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 3,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5.0),
                      topRight: Radius.circular(5.0),
                    ),
                    child: Image.network(
                      city['city_photo'],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          city['city_name'],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          city['city_country'],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
