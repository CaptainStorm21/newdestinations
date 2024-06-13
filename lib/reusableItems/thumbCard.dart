import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newdestinations/cubit/thumb_card_cubit.dart';
import 'package:newdestinations/cubit/thumb_card_state.dart';

class ThumbCard extends StatelessWidget {
  final String cityName;
  final String countryName;
  final int sitesToVisit;
  final int hiddenGems;

  const ThumbCard({
    Key? key,
    required this.cityName,
    required this.countryName,
    required this.sitesToVisit,
    required this.hiddenGems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThumbCardCubit(),
      child: BlocBuilder<ThumbCardCubit, ThumbCardState>(
        builder: (context, state) {
          return SizedBox(
            height: 150.0,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Container(
              color: Colors.lightBlue, // Add light blue background color
              child: Card(
                child: Row(
                  children: [
                    SizedBox(
                      width: 300.0,
                      height: 190.0,
                      child: Image.asset(
                        'assets/download.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 6.0),
                              child: Text(
                                '$cityName',
                                style: const TextStyle(fontSize: 16.0),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(height: 12), // Add SizedBox with height 12px
                            Padding(
                              padding: const EdgeInsets.only(bottom: 6.0),
                              child: Text(
                                countryName,
                                style: const TextStyle(fontSize: 16.0), // Example of using TextStyle directly
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(height: 12), // Add SizedBox with height 12px
                            Row(
                              children: [
                                const Icon(Icons.location_on),
                                Text('Sites to Visit: $sitesToVisit'),
                              ],
                            ),
                            SizedBox(height: 12), // Add SizedBox with height 12px
                            Row(
                              children: [
                                const Icon(Icons.diamond),
                                Text('Hidden Gems: $hiddenGems'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
