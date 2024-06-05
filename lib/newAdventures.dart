import 'dart:math';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';

class NewAdventures extends StatefulWidget {
  const NewAdventures({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NewAdventuresState createState() => _NewAdventuresState();
}

class _NewAdventuresState extends State<NewAdventures> {
  List<dynamic> adventures = [];

  @override
  void initState() {
    super.initState();
    loadAdventures();
  }

  FutureOr<void> loadAdventures() async {
    try {
      final String response =
          await rootBundle.loadString('assets/data/newAdventures.json');
      final List<dynamic> data = json.decode(response);
      setState(() {
        adventures = data;
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error loading adventures: $e');
      }
    }
  }

  List<dynamic> getRandomAdventures() {
    final random = Random();
    final Set<int> indices = {};
    while (indices.length < 9) {
      indices.add(random.nextInt(adventures.length));
    }
    return indices.map((index) => adventures[index]).toList();
  }

  @override
  Widget build(BuildContext context) {
    if (adventures.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    final randomAdventures = getRandomAdventures();

    return Scaffold(
      appBar: AppBar(
        title: const Text('New Adventures'),
      ),
      body: PageView.builder(
        itemCount: 3,
        itemBuilder: (context, pageIndex) {
          return Column(
            children: List.generate(3, (index) {
              final adventure = randomAdventures[pageIndex * 3 + index];
              return Card(
                margin: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.network(
                      adventure['photo_url'] ??
                          'https://www.matx.com.au/images/default-image.jpg',
                      width: 140,
                      height: 120,
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return Image.network(
                          'https://www.matx.com.au/images/default-image.jpg',
                          width: 140,
                          height: 120,
                        );
                      },
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              adventure['name'] ?? '',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${adventure['city'] ?? ''}, ${adventure['country'] ?? ''}',
                            ),
                            Text(adventure['description'] ?? ''),
                            Text('Fact: ${adventure['fact'] ?? ''}'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                  ),
                                  child: const Text('Explore This'),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                  ),
                                  child: const Text("Let's Go"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
