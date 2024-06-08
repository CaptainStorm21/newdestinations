import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'MyCurrentLocation.dart';
import 'AirportsNearby.dart';
import 'TrainsNearby.dart';
import 'SeaportNearby.dart';
import 'google_place_provider.dart';

class DestinationMain extends StatefulWidget {
  const DestinationMain({super.key});

  @override
  _DestinationMainState createState() => _DestinationMainState();
}

class _DestinationMainState extends State<DestinationMain> {
  late Position currentPosition;
  String currentCity = '';
  String currentState = '';

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  void _getCurrentLocation() async {
    currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemarks = await placemarkFromCoordinates(currentPosition.latitude, currentPosition.longitude);
    if (placemarks.isNotEmpty) {
      setState(() {
        currentCity = placemarks[0].locality ?? '';
        currentState = placemarks[0].administrativeArea ?? '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final googlePlace = Provider.of<GooglePlaceProvider>(context).googlePlace;

    return Scaffold(
      appBar: AppBar(title: const Text('Destination Main')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyCurrentLocation(city: currentCity, state: currentState),
            AirportsNearby(googlePlace: googlePlace, currentPosition: currentPosition),
            TrainsNearby(googlePlace: googlePlace, currentPosition: currentPosition),
            SeaportNearby(googlePlace: googlePlace, currentPosition: currentPosition),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => GooglePlaceProvider('AIzaSyCsDn8FS6C9tpS9zaOgNMcxXbMp4zfwwcA'),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DestinationMain(),
    );
  }
}
