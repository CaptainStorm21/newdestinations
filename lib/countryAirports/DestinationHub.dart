import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
import 'DestinationMain.dart';
import 'google_place_provider.dart';

// ! use main method only once for a single project.
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) =>
              GooglePlaceProvider('AIzaSyCsDn8FS6C9tpS9zaOgNMcxXbMp4zfwwcA'),
        ),
      ],
      child: const DestinationHub(),
    ),
  );
}

class DestinationHub extends StatelessWidget {
  const DestinationHub({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DestinationMain(),
    );
  }
}
