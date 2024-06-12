import 'package:newdestinations/main.dart';

class UNESCOSite {
  final String name;
  final String description;
  final Location location;
  final String photoUrl;

  UNESCOSite({
    required this.name,
    required this.description,
    required this.location,
    required this.photoUrl,
  });

  factory UNESCOSite.fromJson(Map<String, dynamic> json) {
    final photos = json['photos'];
    final photoReference = photos != null && photos.isNotEmpty ? photos[0]['photo_reference'] : null;
    final photoUrl = photoReference != null
        ? 'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=$photoReference&key=$googleMapKey'
        : '';

    return UNESCOSite(
      name: json['name'],
      description: json['formatted_address'], // Using formatted_address as a brief description
      location: Location.fromJson(json['geometry']['location']),
      photoUrl: photoUrl,
    );
  }
}

class Location {
  final String city;
  final String state;
  final String country;

  Location({
    required this.city,
    required this.state,
    required this.country,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    // This part depends on how you want to parse the location from the Google Places API
    // Here, you would typically parse the address components to get city, state, and country
    return Location(
      city: '', // Parse from address components
      state: '', // Parse from address components
      country: '', // Parse from address components
    );
  }
}
