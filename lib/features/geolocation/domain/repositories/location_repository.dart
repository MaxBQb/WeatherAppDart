import 'package:dartz/dartz.dart';
import 'package:weather_app/core/domain/failures/failures.dart';

import '../model/location.dart';

abstract class LocationRepository {
  Future<Either<Failure, Location>> getCurrent();
  Future<Either<Failure, Iterable<Location>>> getByName(String location);
  Future<Either<Failure, Location>> get();
  Future<Either<Failure, Location>> set(Location location);
}
