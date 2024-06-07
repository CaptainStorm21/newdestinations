import 'package:flutter/material.dart';
import 'package:newdestinations/countryScreen/countryTabWidget.dart';
import 'package:newdestinations/emergencyNumbers/EmergencyInfo.dart';
import 'package:newdestinations/search/search.dart';

class CountryScreen extends StatelessWidget {
  const CountryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final country = "Scotland"; // Change var to final for better type inference
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Explore $country'), // Use the 'country' variable here
      ),
      body: SingleChildScrollView(
        child: Column(
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
            // Adding CountryTabWidget
            SizedBox(
              height: height * 0.6,
              child: CountryTabWidget(),
            ),
            // Adding a row at the bottom
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                 
                  Expanded(
                    child: Container(
                      color: Colors.blueGrey,
                      height: 700,
                      child: Center(
                        child: country == 'Scotland'
                            ? const EmergencyInfo(
                                // Pass your emergency numbers data here
                                emergencyNumbers: {},
                                nonEmergencyNumbers: {},
                              ) // Display EmergencyInfo widget if country is Scotland
                            : Center(
                                child: Text(
                                    'No emergency information available for $country'),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
