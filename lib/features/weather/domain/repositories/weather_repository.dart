import 'package:dartz/dartz.dart';
import 'package:weather_app/core/domain/failures/failures.dart';
import 'package:weather_app/features/weather/domain/entities/weather.dart';

abstract class WeatherRepository {
  Future<Either<Failure, List<Weather>>> get(double lon, double lat, String tz);
}
