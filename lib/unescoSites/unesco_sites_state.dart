import 'package:equatable/equatable.dart';
import '../models/unesco_site.dart';

abstract class UNESCOsitesState extends Equatable {
  const UNESCOsitesState();

  @override
  List<Object> get props => [];
}

class UNESCOsitesInitial extends UNESCOsitesState {}

class UNESCOsitesLoading extends UNESCOsitesState {}

class UNESCOsitesLoaded extends UNESCOsitesState {
  final List<UNESCOSite> sites;

  const UNESCOsitesLoaded({required this.sites});

  @override
  List<Object> get props => [sites];
}

class UNESCOsitesError extends UNESCOsitesState {}
