import 'package:flutter/material.dart';
import 'package:newdestinations/SearchfarDestination/SearchBarDestination.dart';
import 'package:newdestinations/sections/countryTabs.dart';

class ExploreCountry extends StatelessWidget {
  final String country;

  const ExploreCountry({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore Country'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                'Country: $country',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: SearchbarDestination(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: SizedBox(
                height: 300,
                child: Image.network(
                  'https://i.pinimg.com/564x/0d/3b/7e/0d3b7e3bd2ebb400a419d2e35b374c3a.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
                         Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: SizedBox(
                width: screenWidth,
                height: 200,
                child: const CountryTabs(),
              ),
            ),
             Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: SizedBox(
                width: screenWidth,
                height: 200,
                child: const CountryTabs(),
              ),
            ),
             Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: SizedBox(
                width: screenWidth,
                height: 200,
                child: const CountryTabs(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColorfulContainerRow(String text, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: <Widget>[
          Container(
            width: 50,
            height: 50,
            color: color,
            child: Center(child: Text(text)),
          ),
        ],
      ),
    );
  }
}
