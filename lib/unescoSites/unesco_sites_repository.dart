import 'dart:convert';
import 'package:http/http.dart' as http;
import '../main.dart';
import '../models/unesco_site.dart';

class UNESCOsitesRepository {
  // final String _apiKey = 'YOUR_GOOGLE_API_KEY'; // Replace with your Google API key
  final String _baseUrl = 'https://maps.googleapis.com/maps/api/place/textsearch/json?query=UNESCO+world+heritage+sites&key=';

  Future<List<UNESCOSite>> fetchUNESCOSites() async {
    final response = await http.get(Uri.parse('$_baseUrl$googleMapKey'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List sites = data['results'];
      List<UNESCOSite>  list = sites.map((json) => UNESCOSite.fromJson(json)).toList();
      list.sort((a, b) => a.name.compareTo(b.name),);
      return list;
    } else {
      throw Exception('Failed to load UNESCO sites');
    }
  }
}