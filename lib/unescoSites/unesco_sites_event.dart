import 'package:equatable/equatable.dart';

abstract class UNESCOsitesEvent extends Equatable {
  const UNESCOsitesEvent();

  @override
  List<Object> get props => [];
}

class FetchUNESCOSites extends UNESCOsitesEvent {}
