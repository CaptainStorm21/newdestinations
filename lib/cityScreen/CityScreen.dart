import 'package:flutter/material.dart';
import 'package:newdestinations/cityScreen/citiesBanner.dart';
import 'package:newdestinations/search/search.dart';
// import 'package:newdestinations/widgets/countryTabWidget.dart'; // Ensure this import exists

class CityScreen extends StatelessWidget {
  const CityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    const city = 'Edinburgh'; // Use const for compile-time constant

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Explore $city'),
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
                      'https://www.localeyestours.co.uk/wp-content/uploads/2023/07/deanvillagewalkingtour-scaled.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: CityBanner(), // Corrected placement of CityBanner
            ),
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
            // Adding another row above the next Padding
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Row(
                children: [
 
                ],
              ),
            ),
            // Adding CountryTabWidget
            // SizedBox(
            //   height: height * 0.6,
            //   child: const CountryTabWidget(),
            // ),
            // // Adding a row at the bottom
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(15.0),
                      color: Colors.grey,
                      child: const Text(
                        'Bottom Row Cell 1',
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
                        'Bottom Row Cell 2',
                        textAlign: TextAlign.center,
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
