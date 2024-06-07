import 'dart:math';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class Destination {
  final int id;
  final String destinationName;
  final String destinationDescription;
  final String destinationImage;

  Destination({
    required this.id,
    required this.destinationName,
    required this.destinationDescription,
    required this.destinationImage,
  });

  factory Destination.fromJson(Map<String, dynamic> json) {
    return Destination(
      id: json['id'],
      destinationName: json['destination_name'],
      destinationDescription: json['destination_description'],
      destinationImage: json['destination_image'],
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late List<Destination> destinations;
  late Destination currentDestination = Destination(
    id: 0,
    destinationName: '',
    destinationDescription: '',
    destinationImage: '',
  );

  @override
  void initState() {
    super.initState();
    loadDestinations();
  }

  Future<void> loadDestinations() async {
    try {
      String data =
          await rootBundle.loadString('assets/json/splashDestination.json');
      List<dynamic> jsonList = json.decode(data)['destinations'];
      destinations =
          jsonList.map((e) => Destination.fromJson(e)).toList();
      setState(() {
        currentDestination =
            destinations[Random().nextInt(destinations.length)];
      });
    } catch (e) {
      Text('Error loading destinations: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(currentDestination.destinationImage),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            currentDestination.destinationName
                                .toUpperCase(),
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              shadows: const [
                                Shadow(
                                  blurRadius: 3,
                                  color: Color(0xFFCdC2a2),
                                  offset: Offset(1, 1),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            currentDestination.destinationDescription,
                            style: const TextStyle(
                              color: Color(0xFFe7e2da),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Center(
               // child: LoginScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
