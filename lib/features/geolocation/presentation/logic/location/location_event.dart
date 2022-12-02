part of 'bloc.dart';

@immutable
abstract class LocationEvent extends Equatable {}

class FindLocationEvent extends LocationEvent {
  final String search;

  FindLocationEvent({required this.search});

  @override
  List<Object?> get props => [search];
}

class GetCurrentLocationEvent extends LocationEvent {
  GetCurrentLocationEvent();

  @override
  List<Object?> get props => [];
}

class SetLocationEvent extends LocationEvent {
  final Location location;

  SetLocationEvent({required this.location});

  @override
  List<Object?> get props => [location];
}

class GetLocationEvent extends LocationEvent {
  GetLocationEvent();

  @override
  List<Object?> get props => [];
}
