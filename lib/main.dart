import 'package:flutter/material.dart';
import 'package:newdestinations/contactDFT.dart';
import 'package:newdestinations/gotSuggestion.dart';
import 'package:newdestinations/countryAirports/countryAirports.dart';
import 'package:newdestinations/freeLocalEvents/freeLocalEvents.dart';
import 'package:newdestinations/search.dart'; // Ensure this file exists
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
          title: const Text('Vertical Text Stack'),
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
        const Center(child: Text('hello world')),
        const SizedBox(height: 20), // Add vertical spacing
        const Center(child: Text('good bye')),
        const SizedBox(height: 20), // Add vertical spacing
        const Center(child: Text('where did my cat go?')),
        const SizedBox(height: 20), // Add vertical spacing
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const CountryAirports(countryCode: 'Scotland')), // Navigate to the gotSuggestion.dart screen
            );
          },
          child: const Text('Airports'),
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
