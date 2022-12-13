import 'package:weather_app/core/domain/utils/date_utils.dart';

import '../../../domain/entities/weather.dart';

class WeatherDto {
  int? utcOffsetSeconds;
  Daily? daily;

  WeatherDto({this.utcOffsetSeconds, this.daily});

  WeatherDto.fromJson(Map<String, dynamic> json) {
    utcOffsetSeconds = json['utc_offset_seconds'];
    daily = json['daily'] != null ? Daily.fromJson(json['daily']) : null;
  }

  List<Weather> toModel() {
    List<Weather> result = [];
    for (var i = 0; i < (daily?.time?.length ?? 0); i++) {
      result.add(Weather(
          time: unixToDateString(daily!.time![i] + utcOffsetSeconds!),
          temperatureMax: "${daily?.temperature2mMax?[i]}°C",
          temperatureMin: "${daily?.temperature2mMin?[i]}°C",
          apparentTemperatureMax: "${daily?.apparentTemperatureMax?[i]}°C",
          apparentTemperatureMin: "${daily?.apparentTemperatureMin?[i]}°C",
          sunrise: unixToTimeString(daily!.sunrise![i]),
          sunset: unixToTimeString(daily!.sunset![i]),
          rainSum: "${daily?.rainSum?[i]} мм",
          snowfallSum: "${daily?.snowfallSum?[i]} мм",
          windSpeed: "${daily?.windspeed10mMax?[i]} м/c",
          windDirection: "${daily?.winddirection10mDominant?[i]}°"));
    }
    return result;
  }
}

class Daily {
  List<int>? time;
  List<double>? temperature2mMax;
  List<double>? temperature2mMin;
  List<double>? apparentTemperatureMax;
  List<double>? apparentTemperatureMin;
  List<int>? sunrise;
  List<int>? sunset;
  List<double>? rainSum;
  List<double>? snowfallSum;
  List<double>? windspeed10mMax;
  List<int>? winddirection10mDominant;

  Daily(
      {this.time,
      this.temperature2mMax,
      this.temperature2mMin,
      this.apparentTemperatureMax,
      this.apparentTemperatureMin,
      this.sunrise,
      this.sunset,
      this.rainSum,
      this.snowfallSum,
      this.windspeed10mMax,
      this.winddirection10mDominant});

  Daily.fromJson(Map<String, dynamic> json) {
    time = json['time'].cast<int>();
    temperature2mMax = json['temperature_2m_max'].cast<double>();
    temperature2mMin = json['temperature_2m_min'].cast<double>();
    apparentTemperatureMax = json['apparent_temperature_max'].cast<double>();
    apparentTemperatureMin = json['apparent_temperature_min'].cast<double>();
    sunrise = json['sunrise'].cast<int>();
    sunset = json['sunset'].cast<int>();
    rainSum = json['rain_sum'].cast<double>();
    snowfallSum = json['snowfall_sum'].cast<double>();
    windspeed10mMax = json['windspeed_10m_max'].cast<double>();
    winddirection10mDominant = json['winddirection_10m_dominant'].cast<int>();
  }
}
