import 'package:floor/floor.dart';
import 'package:weather_app/features/weather/domain/entities/weather.dart';

@entity
class WeatherEntity {
  @PrimaryKey(autoGenerate: true)
  int id;
  final String? time;
  final String? temperatureMax;
  final String? temperatureMin;
  final String? apparentTemperatureMax;
  final String? apparentTemperatureMin;
  final String? sunrise;
  final String? sunset;
  final String? rainSum;
  final String? snowfallSum;
  final String? windSpeed;
  final String? windDirection;

  WeatherEntity({
    required this.id,
    required this.time,
    required this.temperatureMax,
    required this.temperatureMin,
    required this.apparentTemperatureMax,
    required this.apparentTemperatureMin,
    required this.sunrise,
    required this.sunset,
    required this.rainSum,
    required this.snowfallSum,
    required this.windSpeed,
    required this.windDirection,
  });

  WeatherEntity.fromModel(Weather model) : this(
    id: -1,
    time: model.time,
    temperatureMax: model.temperatureMax,
    temperatureMin: model.temperatureMin,
    apparentTemperatureMax: model.apparentTemperatureMax,
    apparentTemperatureMin: model.apparentTemperatureMin,
    sunrise: model.sunrise,
    sunset: model.sunset,
    rainSum: model.rainSum,
    snowfallSum: model.snowfallSum,
    windSpeed: model.windSpeed,
    windDirection: model.windDirection,
  );

  Weather toModel() =>
      Weather(time: time,
          temperatureMax: temperatureMax,
          temperatureMin: temperatureMin,
          apparentTemperatureMax: apparentTemperatureMax,
          apparentTemperatureMin: apparentTemperatureMin,
          sunrise: sunrise,
          sunset: sunset,
          rainSum: rainSum,
          snowfallSum: snowfallSum,
          windSpeed: windSpeed,
          windDirection: windDirection);
}
