// lib/models/national_park.dart
import 'package:equatable/equatable.dart';

class NationalPark extends Equatable {
  final String name;
  final String photoUrl;
  final String location;

  const NationalPark({
    required this.name,
    required this.photoUrl,
    required this.location,
  });

  @override
  List<Object> get props => [name, photoUrl, location];
}
