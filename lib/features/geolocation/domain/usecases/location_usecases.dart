import 'package:dartz/dartz.dart';
import 'package:weather_app/core/domain/failures/failures.dart';

import '../model/location.dart';
import '../repositories/location_repository.dart';

class LocationUseCases {
  final LocationRepository repository;

  const LocationUseCases({required this.repository});

  Future<Either<Failure, Location>> getCurrent() async {
    return repository.getCurrent();
  }

  Future<Either<Failure, Iterable<Location>>> getByName(String name) async {
    return repository.getByName(name);
  }

  Future<Either<Failure, Location>> get() async {
    return repository.get();
  }

  Future<Either<Failure, Location>> set(Location location) async {
    return repository.set(location);
  }
}
