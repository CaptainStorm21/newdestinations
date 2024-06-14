// lib/locationDetails/location_details.dart
import 'package:flutter/material.dart';
import '../models/national_park.dart';

class LocationDetails extends StatelessWidget {
  final NationalPark park;

  const LocationDetails({super.key, required this.park});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(park.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          park.photoUrl.isNotEmpty
              ? Image.network(park.photoUrl)
              : Container(
                  height: 200,
                  color: Colors.grey,
                  child: const Center(child: Text('No Image')),
                ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              park.location,
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
