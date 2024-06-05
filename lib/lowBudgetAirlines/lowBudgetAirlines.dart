import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

class LowBudgetAirlines extends StatefulWidget {
  const LowBudgetAirlines({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LowBudgetAirlinesState createState() => _LowBudgetAirlinesState();
}

class _LowBudgetAirlinesState extends State<LowBudgetAirlines> {
  List<Map<String, dynamic>> airlines = [];

  @override
  void initState() {
    super.initState();
    fetchAirlinesData();
  }

  FutureOr<void> fetchAirlinesData() async {
    final response = await http.get(Uri.parse('assets/data/lowBudgetAirlines.json'));
    if (response.statusCode == 200) {
      setState(() {
        airlines = json.decode(response.body) as List<Map<String, dynamic>>;
      });
    } else {
      throw Exception('Failed to load airline data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Low Budget Airlines'),
      ),
      body: ListView.builder(
        itemCount: airlines.length,
        itemBuilder: (context, index) {
          final airline = airlines[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: Image.network(
                airline['logo_url'],
                width: 50,
                height: 50,
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(airline['name']),
                  Text(airline['description']),
                  const SizedBox(
                      height: 8), // Add some spacing between text and button
                  ElevatedButton(
                    onPressed: () {
                      _launchURL(context, airline['website_url']);
                    },
                    child: const Text('Book my flight'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _launchURL(BuildContext context, String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch $url')),
      );
    }
  }
}
