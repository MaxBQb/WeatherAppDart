import 'package:dartz/dartz.dart';
import 'package:weather_app/core/domain/failures/failures.dart';
import 'package:weather_app/features/geolocation/domain/usecases/location_usecases.dart';

import '../entities/weather.dart';
import '../repositories/weather_repository.dart';

class WeatherUseCases {
  final WeatherRepository repository;
  final LocationUseCases useCases;
  const WeatherUseCases({required this.repository, required this.useCases});
  Future<Either<Failure, List<Weather>>> get() async {
    var location = await useCases.get();
    return location.fold(
        (failure) => left(NoSavedLocationFailure()),
        (success) => repository.get(success.longitude, success.latitude,
            success.timezone ?? "Europe/Moscow"));
  }
}
