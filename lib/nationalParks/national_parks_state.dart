// lib/nationalParks/national_parks_state.dart
import 'package:equatable/equatable.dart';
import '../models/national_park.dart';

class NationalParksState extends Equatable {
  final bool loading;
  final List<NationalPark> parks;
  final String error;

  const NationalParksState({
    required this.loading,
    required this.parks,
    required this.error,
  });

  factory NationalParksState.initial() {
    return const NationalParksState(loading: false, parks: [], error: '');
  }

  NationalParksState copyWith({
    bool? loading,
    List<NationalPark>? parks,
    String? error,
  }) {
    return NationalParksState(
      loading: loading ?? this.loading,
      parks: parks ?? this.parks,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [loading, parks, error];
}
