import 'package:dartz/dartz.dart';
import 'package:weather_app/core/data/remote/exceptions/exceptions.dart';
import 'package:weather_app/core/domain/failures/failures.dart';
import 'package:weather_app/features/geolocation/data/local/source/local_location_source.dart';
import 'package:weather_app/features/geolocation/domain/model/location.dart';

import '../../domain/repositories/location_repository.dart';
import '../local/source/current_location_source.dart';
import '../remote/source/remote_location_source.dart';

class LocationRepositoryImpl implements LocationRepository {
  final RemoteLocationSource remote;
  final CurrentLocationService current;
  final LocalLocationSource local;

  const LocationRepositoryImpl(
      {required this.remote, required this.current, required this.local});

  @override
  Future<Either<Failure, Location>> getCurrent() async {
    try {
      final result = await current.determinePosition();
      return set(result);
    } on LocationException catch (e) {
      return left(LocationFailure(e.message));
    } catch (e) {
      return left(UnexpectedFailure());
    }
  }

  @override
  Future<Either<Failure, Iterable<Location>>> getByName(String location) async {
    try {
      final result = await remote.getLocationsByName(location);
      return right(result);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } on InternetException catch (_) {
      return left(SocketFailure());
    }
  }

  @override
  Future<Either<Failure, Location>> get() async {
    try {
      final result = await local.get();
      if (result == null) {
        return left(UnexpectedFailure());
      }
      return right(result);
    } on UnexpectedException catch (_) {
      return left(UnexpectedFailure());
    }
  }

  @override
  Future<Either<Failure, Location>> set(Location location) async {
    try {
      await local.save(location);
      return get();
    } on UnexpectedException catch (_) {
      return left(UnexpectedFailure());
    }
  }
}
