import 'package:flutter/material.dart';
import 'package:newdestinations/cityScreen/CityScreen.dart';
import 'package:newdestinations/contactDFT.dart';
import 'package:newdestinations/countryAirports/DestinationHub.dart';
import 'package:newdestinations/countryScreen/countryTabWidget.dart';
import 'package:newdestinations/gotSuggestion.dart';
import 'package:newdestinations/abbr/airportWidget.dart';
import 'package:newdestinations/freeLocalEvents/freeLocalEvents.dart';
import 'package:newdestinations/lowBudgetAirlines/lowBudgetAirlines.dart';
import 'package:newdestinations/search/search.dart'; // Ensure this file exists
import 'package:newdestinations/countryScreen/countryScreen.dart';
// ignore: unused_import

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Testing Screen'),
        ),
        body: const MyWidget(),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
          const SizedBox(height: 20), // Add vertical rspacing
        // ElevatedButton(
        //   onPressed: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //           builder: (context) =>
        //               const ()), // Navigate to the gotSuggestion.dart screen
        //     );
        //   },
        //   child: const Text('Main Screen'),
        // ),
         const SizedBox(height: 20), // Add vertical rspacing
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const CityScreen()), // Navigate to the gotSuggestion.dart screen
            );
          },
          child: const Text('City Screen'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                       const CountryScreen()), // Navigate to the gotSuggestion.dart screen
            );
          },
          child: const Text('Country Screenn'),
        ),
        const SizedBox(height: 20), // Add vertical spacing
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      CountryTabWidget()), // Navigate to the gotSuggestion.dart screen
            );
          },
          child: const Text('CountryTabWidget'),
        ),
        const SizedBox(height: 20), // Add vertical spacing
  ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const LowBudgetAirlines()), // Navigate to the gotSuggestion.dart screen
            );
          },
          child: const Text('Low Budget Airlines'),
        ),
        const SizedBox(height: 20), // Add vertical spacing

        const Center(child: Text('hello world')),
        const SizedBox(height: 20), // Add vertical spacing

        const Center(child: Text('hello world')),
        const SizedBox(height: 20), // Add vertical spacing

        const Center(child: Text('good bye')),
        const SizedBox(height: 20), // Add vertical spacing

        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const SearchScreen()), // Navigate to the gotSuggestion.dart screen
            );
          },
          child: const Text('Searchbar Reusable'),
        ),
        const SizedBox(height: 20), // Add vertical spacing
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const AirportWidget(), // Navigate to the gotSuggestion.dart screen
              ),
            );
          },
          child: const Text('Airports Abbreviations'),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const DestinationHub(), // Navigate to the gotSuggestion.dart screen
            ));
          },
          child: const Text('Destination Main'),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const FreeLocalEvents()), // Navigate to the gotSuggestion.dart screen
            );
          },
          child: const Text('Free Events'),
        ),
        const SizedBox(height: 20), // Add vertical spacing
        //  const GotSuggestionForm(),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const GotSuggestionForm()), // Navigate to the gotSuggestion.dart screen
            );
          },
          child: const Text('Click for Suggestion'),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const ContactUsForm()), // Navigate to the gotSuggestion.dart screen
            );
          },
          child: const Text('Contact Us'),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const SearchScreen()), // Navigate to the gotSuggestion.dart screen
            );
          },
          child: const Text('Searchbar Reusable'),
        ),
      ],
    );
  }
}
