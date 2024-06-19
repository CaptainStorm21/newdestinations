import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// The CountryCityCubit and CountryCityState classes

class CountryCityCubit extends Cubit<CountryCityState> {
  CountryCityCubit() : super(CountryCityState());

  void updateCountry(String country) {
    emit(state.copyWith(country: country));
  }

  void updateCity(String city) {
    emit(state.copyWith(city: city));
  }
}

class CountryCityState {
  final String country;
  final String city;

  CountryCityState({this.country = '', this.city = ''});

  CountryCityState copyWith({String? country, String? city}) {
    return CountryCityState(
      country: country ?? this.country,
      city: city ?? this.city,
    );
  }
}

// The main CountryCityBeltTemplate class

class CountryCityBeltTemplate extends StatelessWidget {
  const CountryCityBeltTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CountryCityCubit(),
      child: CountryCityView(),
    );
  }
}

// Mock data representing cities

const List<Map<String, dynamic>> cities = [
  {"id": 1, "city_name": "Abercrombie", "city_image": "1.jpg", "Country_name": "Scotland", "city_url": "cityScreen.dart"},
  {"id": 2, "city_name": "Balfour", "city_image": "2.jpg", "Country_name": "Scotland", "city_url": "cityScreen.dart"},
  {"id": 3, "city_name": "Cairndow", "city_image": "3.jpg", "Country_name": "Scotland", "city_url": "cityScreen.dart"},
  {"id": 4, "city_name": "Dalry", "city_image": "4.jpg", "Country_name": "Scotland", "city_url": "cityScreen.dart"},
  {"id": 5, "city_name": "Ecclefechan", "city_image": "5.jpg", "Country_name": "Scotland", "city_url": "cityScreen.dart"},
  {"id": 6, "city_name": "Falkland", "city_image": "6.jpg", "Country_name": "Scotland", "city_url": "cityScreen.dart"},
  {"id": 7, "city_name": "Glenfinnan", "city_image": "7.jpg", "Country_name": "Scotland", "city_url": "cityScreen.dart"},
  {"id": 8, "city_name": "Haddington", "city_image": "8.jpg", "Country_name": "Scotland", "city_url": "cityScreen.dart"},
  {"id": 9, "city_name": "Inverkip", "city_image": "9.jpg", "city_url": "cityScreen.dart"},
  {"id": 10, "city_name": "Johnshaven", "city_image": "10.jpg", "Country_name": "Slovakia", "city_url": "cityScreen.dart"},
  {"id": 11, "city_name": "Marseille", "city_image": "11.jpg", "Country_name": "France", "city_url": "cityScreen.dart"},
  {"id": 12, "city_name": "Leipzig", "city_image": "12.jpg", "Country_name": "Germany", "city_url": "cityScreen.dart"},
  {"id": 13, "city_name": "Ghent", "city_image": "13.jpg", "Country_name": "Sweden", "city_url": "cityScreen.dart"},
  {"id": 14, "city_name": "Turin", "city_image": "14.jpg", "city_url": "cityScreen.dart", "Country_name": "Italy"},
  {"id": 15, "city_name": "Porto", "city_image": "15.jpg", "city_url": "cityScreen.dart", "Country_name": "Portugal"},
  {"id": 16, "city_name": "Seville", "city_image": "16.jpg", "city_url": "cityScreen.dart", "Country_name": "Spain"},
  {"id": 17, "city_name": "Nuremberg", "city_image": "17.jpg", "city_url": "cityScreen.dart", "Country_name": "Netherlands"},
  {"id": 18, "city_name": "Salzburg", "city_image": "18.jpg", "city_url": "cityScreen.dart", "Country_name": "Austria"},
  {"id": 19, "city_name": "Valencia", "city_image": "19.jpg", "city_url": "cityScreen.dart", "Country_name": "Spain"},
  {"id": 20, "city_name": "Krakow", "city_image": "20.jpg", "city_url": "cityScreen.dart", "Country_name": "Poland"}
];

// The main CountryCityView class

class CountryCityView extends StatelessWidget {
  const CountryCityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(labelText: 'Country'),
          onChanged: (value) =>
              context.read<CountryCityCubit>().updateCountry(value),
        ),
        TextField(
          decoration: const InputDecoration(labelText: 'City'),
          onChanged: (value) =>
              context.read<CountryCityCubit>().updateCity(value),
        ),
        BlocBuilder<CountryCityCubit, CountryCityState>(
          builder: (context, state) {
            final filteredCities = cities
                .where((city) => city['Country_name'] == 'Scotland')
                .map((city) => ListTile(
                      title: Text(city['city_name']),
                      leading: Image.asset('assets/${city['city_image']}'),
                      onTap: () {
                        Navigator.pushNamed(context, city['city_url']);
                      },
                    ))
                .toList();

            return Column(
              children: [
                Text('Country: ${state.country}'),
                Text('City: ${state.city}'),
                ...filteredCities,
              ],
            );
          },
        ),
      ],
    );
  }
}
