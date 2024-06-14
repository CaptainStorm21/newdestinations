import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/national_park.dart';
import 'national_parks_state.dart';

class NationalParksCubit extends Cubit<NationalParksState> {
  NationalParksCubit() : super(NationalParksState.initial());

final String apiKey = 'AIzaSyCsDn8FS6C9tpS9zaOgNMcxXbMp4zfwwcA';

  Future<void> fetchNationalParks() async {
    emit(state.copyWith(loading: true));

    List<NationalPark> parks = [];
    int pageCount = 0;
    int resultsPerPage = 10; // Number of results to display per page

    String? nextPageToken; // Initialize nextPageToken as nullable

    do {
      // Construct the URL to include both "National Park" and "National Forest"
      String query = 'National Park OR National Forest';
      String url =
          'https://maps.googleapis.com/maps/api/place/textsearch/json?query=$query&key=$apiKey';

      if (nextPageToken != null) {
        url += '&pagetoken=$nextPageToken';
      }

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> results = data['results'];
        nextPageToken = data['next_page_token']; // Check for next page token

        // Process each park result
        parks.addAll(results
            .where((park) =>
                park['name'].contains('National Park') ||
                park['name'].contains('National Forest'))
            .map((park) {
          return NationalPark(
            name: park['name'],
            photoUrl: park['photos'] != null && park['photos'].isNotEmpty
                ? 'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=${park['photos'][0]['photo_reference']}&key=$apiKey'
                : '',
            location: park['formatted_address'],
          );
        }));

        // Increment page count
        pageCount++;

        // Break if enough results have been fetched
        if (parks.length >= resultsPerPage * pageCount) {
          break;
        }
      } else {
        emit(state.copyWith(loading: false, error: 'Failed to fetch data'));
        return; // Exit function on error
      }
    } while (nextPageToken != null); // Continue fetching until no more pages

    // Take only the first 'resultsPerPage' results
    parks = parks.take(resultsPerPage).toList();

    emit(state.copyWith(loading: false, parks: parks));
  }
}




//  final String apiKey = 'AIzaSyCsDn8FS6C9tpS9zaOgNMcxXbMp4zfwwcA';
