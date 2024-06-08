import 'package:flutter/material.dart';
import 'package:google_place/google_place.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class SeaportNearby extends StatelessWidget {
  final GooglePlace googlePlace;
  final Position currentPosition;

  const SeaportNearby({super.key, required this.googlePlace, required this.currentPosition});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NearBySearchResponse?>(
      future: googlePlace.search.getNearBySearch(
        Location(lat: currentPosition.latitude, lng: currentPosition.longitude),
        160934, // 100 miles in meters
        type: 'seaport',
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.data == null || snapshot.data!.results == null || snapshot.data!.results!.isEmpty) {
          return const Text('No seaports found');
        } else {
          return Column(
            children: snapshot.data!.results!.map((result) {
              return Card(
                child: ListTile(
                  leading: const Icon(Icons.directions_boat),
                  title: Text(result.name!),
                  onTap: () async {
                    final url = 'https://www.google.com/maps/search/?api=1&query=${result.geometry!.location!.lat},${result.geometry!.location!.lng}';
                    if (await canLaunchUrl(Uri.parse(url))) {
                      await launchUrl(Uri.parse(url));
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
              );
            }).toList(),
          );
        }
      },
    );
  }
}
