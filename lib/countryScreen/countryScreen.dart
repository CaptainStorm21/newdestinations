import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:newdestinations/countryScreen/countryTabWidget.dart';
import 'package:newdestinations/search/search.dart';

class CountryScreen extends StatelessWidget {
  final String countryName = "Scotland";

  const CountryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Explore $countryName'),
      ),
      body: Column(
        children: [
          const SearchScreen(),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Container(
              width: double.infinity,
              height: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://www.rd.com/wp-content/uploads/2017/09/02-Jaw-Dropping-Photos-of-the-Most-Beautiful-Country-in-the-World_251355607-Allinute-Silzeviciute.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Container(
                    height: 100,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          FutureBuilder(
            future: DefaultAssetBundle.of(context).loadString('assets/data/countryTabs.json'),
            builder: (context, AsyncSnapshot<String> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(), // Loading indicator
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'), // Display error message
                );
              } else {
                var tabsData = json.decode(snapshot.data!);
                return CountryTabWidget(tabs: List<Map<String, String>>.from(tabsData));
              }
            },
          ),
        ],
      ),
    );
  }
}
