part of 'bloc.dart';

@immutable
abstract class LocationState extends Equatable {
  const LocationState();
}

class LocationInitial extends LocationState {
  @override
  List<Object> get props => [];
}

class LocationLoading extends LocationState {
  @override
  List<Object> get props => [];
}

class LocationLoaded extends LocationState {
  final Location location;

  const LocationLoaded({required this.location});
  @override
  List<Object> get props => [];
}

class LocationListLoaded extends LocationState {
  final List<Location> locations;

  const LocationListLoaded({required this.locations});
  @override
  List<Object> get props => [];
}

class LocationError extends LocationState {
  final Failure failure;

  const LocationError({required this.failure});
  @override
  List<Object> get props => [];
}
