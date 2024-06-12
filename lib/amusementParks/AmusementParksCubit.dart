import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

enum AmusementParksStatus { loading, loaded, error }

class AmusementParksCubit extends Cubit<AmusementParksStatus> {
  AmusementParksCubit() : super(AmusementParksStatus.loading);

  Future<List<dynamic>> fetchAmusementParks() async {
    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/textsearch/json?query=amusement+parks&key=YOUR_API_KEY_HERE');

    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer YOUR_API_KEY_HERE',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body)['results'];
    } else {
      throw Exception('Failed to load amusement parks');
    }
  }
}
