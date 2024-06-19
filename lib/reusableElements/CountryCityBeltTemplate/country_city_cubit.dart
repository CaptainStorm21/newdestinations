import 'package:bloc/bloc.dart';

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
