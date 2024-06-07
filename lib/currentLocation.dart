import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:timezone/timezone.dart' as tz;



class CurrentLocation extends StatefulWidget {
  const CurrentLocation({super.key});

  @override
  _CurrentLocationState createState() => _CurrentLocationState();
}

class _CurrentLocationState extends State<CurrentLocation> {
  String _currentCity = "Loading...";

  @override
  void initState() {
    super.initState();
    _getCurrentCity();
  }

  void _getCurrentCity() {
    // Implement logic to get current city
    // For example, you can use Geolocation package to get user's location
    // For demonstration purpose, let's just use a dummy city
    setState(() {
      _currentCity = "New York";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Current City: $_currentCity',
        style: const TextStyle(fontSize: 18.0),
      ),
    );
  }
}


class CurrentSunsetSunrise extends StatelessWidget {
  const CurrentSunsetSunrise({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the current timezone
    tz.Location location = tz.getLocation(tz.local as String);

    // Get the current date in the desired timezone
    tz.TZDateTime now = tz.TZDateTime.now(location);

    // Calculate sunrise and sunset times
    tz.TZDateTime sunrise = tz.TZDateTime.from(DateTime(now.year, now.month, now.day, 6), location);
    tz.TZDateTime sunset = tz.TZDateTime.from(DateTime(now.year, now.month, now.day, 18), location);

    // Format the times
    String formattedSunrise = DateFormat('hh:mm a').format(sunrise);
    String formattedSunset = DateFormat('hh:mm a').format(sunset);

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sunrise: $formattedSunrise',
            style: const TextStyle(fontSize: 18.0),
          ),
          Text(
            'Sunset: $formattedSunset',
            style: const TextStyle(fontSize: 18.0),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Current Location Demo'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
         //   CurrentLocation(),
            SizedBox(height: 20.0),
          // CurrentTimezone(),
            SizedBox(height: 20.0),
           // CurrentSunsetSunrise(),
          ],
        ),
      ),
    ),
  ));
}
