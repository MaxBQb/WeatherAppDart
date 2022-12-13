import 'package:dartz/dartz.dart';
import 'package:weather_app/core/data/remote/exceptions/exceptions.dart';
import 'package:weather_app/core/domain/failures/failures.dart';

import '../../domain/entities/weather.dart';
import '../../domain/repositories/weather_repository.dart';
import '../local/source/local_weather_source.dart';
import '../remote/source/remote_weather_source.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final RemoteWeatherSource remote;
  final LocalWeatherSource local;
  const WeatherRepositoryImpl({required this.remote, required this.local});

  @override
  Future<Either<Failure, List<Weather>>> get(
      double lon, double lat, String tz) async {
    try {
      final result = await remote.getWeekWeather(lon, lat, tz);
      await local.save(result);
      return right(result);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } on InternetException catch (_) {
      try {
        final result = await local.get();
        return right(result);
      } on UnexpectedException catch (_) {
        return left(UnexpectedFailure());
      }
    } on UnexpectedException catch (_) {
      return left(UnexpectedFailure());
    }
  }
}
