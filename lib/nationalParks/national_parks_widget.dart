import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../locationDetails/location_details.dart';
import 'national_parks_cubit.dart';
import 'national_parks_state.dart';

class NationalParksWidget extends StatelessWidget {
  const NationalParksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NationalParksCubit()..fetchNationalParks(),
      child: BlocBuilder<NationalParksCubit, NationalParksState>(
        builder: (context, state) {
          if (state.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.error.isNotEmpty) {
            return Center(child: Text(state.error));
          } else {
            return CarouselSlider.builder(
              itemCount: (state.parks.length / 10).ceil(),
              itemBuilder: (context, index, realIndex) {
                final parks = state.parks.skip(index * 10).take(10).toList();

                return Container(
                  width: 400, // Constrain width of the ListView
                  alignment: Alignment.center, // Center the ListView
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: parks.length,
                    itemBuilder: (context, parkIndex) {
                      final park = parks[parkIndex];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LocationDetails(park: park),
                            ),
                          );
                        },
                        child: SizedBox(
                          width: 400, // Constrain width of the card
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0), // Sharp edges
                              side: const BorderSide(
                                color: Colors.grey,
                                width: 2,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0), // Padding of 10 px
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 160,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      image: park.photoUrl.isNotEmpty
                                          ? DecorationImage(
                                              image: NetworkImage(park.photoUrl),
                                              fit: BoxFit.cover,
                                            )
                                          : null,
                                      color: park.photoUrl.isEmpty
                                          ? Colors.grey
                                          : null,
                                    ),
                                    child: park.photoUrl.isEmpty
                                        ? const Center(child: Text('No Image'))
                                        : null,
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    park.name.replaceAll('"', ''),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(park.location),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
              options: CarouselOptions(
                height: 600,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                viewportFraction: 1.0,
              ),
            );
          }
        },
      ),
    );
  }
}
