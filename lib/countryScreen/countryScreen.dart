import 'package:flutter/material.dart';
import 'package:newdestinations/countryScreen/countryTabWidget.dart';
import 'package:newdestinations/emergencyNumbers/EmergencyInfo.dart';
import 'package:newdestinations/search/search.dart';

class CountryScreen extends StatelessWidget {
  final String countryName = "Scotland";

  const CountryScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    var country = "Scotland";
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Explore $countryName'),
      ),
      body: Column( // Wrap with Column
        crossAxisAlignment: CrossAxisAlignment.stretch, // Expand children to full width
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                // Adding the SearchBar
                const SearchScreen(),
                // Adding the container with the background image
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Container(
                    height: 400,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://hips.hearstapps.com/countryliving.cdnds.net/17/04/1485357430-scotland-kilchurn-castle.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                // Adding a row with 2 cells
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(15.0),
                          color: Colors.grey,
                          child: const Text(
                            'Cell 1',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(15.0),
                          color: Colors.grey,
                          child: const Text(
                            'Cell 2',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Adding spacing
                const SizedBox(height: 20),
                // Your existing widgets go here
                CountryTabWidget(),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.blueGrey,
              height: 100,
              child: Center(
                child:  country == 'Scotland'
                  ? const EmergencyInfo() // Display EmergencyInfo widget if country is Scotland
                  : Center(
                      child: Text('No emergency information available for $country'),
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
