import 'package:flutter/material.dart';
import 'package:google_place/google_place.dart';

class GooglePlaceProvider with ChangeNotifier {
  late GooglePlace googlePlace;

  GooglePlaceProvider(String apiKey) {
    googlePlace = GooglePlace(apiKey);
  }
}