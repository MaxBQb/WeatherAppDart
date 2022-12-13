import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/features/weather/constants.dart';

import '../../../domain/entities/weather.dart';
import '../model/weather_dto.dart';
import '../utils/exception.dart';

abstract class RemoteWeatherSource {
  Future<List<Weather>> getWeekWeather(double lon, double lat, String tz);
}

class RemoteWeatherSourceImpl implements RemoteWeatherSource {
  final Dio dio;

  RemoteWeatherSourceImpl({required this.dio});

  @override
  Future<List<Weather>> getWeekWeather(
      double lon, double lat, String tz) async {
    try {
      Response response;
      response = await dio.get(
          "${WeatherConstants.weatherUrl}/forecast?latitude=$lat&longitude=$lon&daily=${WeatherConstants.daily}&windspeed_unit=${WeatherConstants.windspeedUnit}&timeformat=${WeatherConstants.timeFormat}&timezone=$tz");

      log("RESPONSE$response");
      if (response.statusCode != 200) {
        throw ExceptionUtils.dioStatusCodeErrorHandle(response.statusCode);
      } else {
        return WeatherDto.fromJson(response.data).toModel();
      }
    } on DioError catch (e, stacktrace) {
      log(stacktrace.toString());
      throw ExceptionUtils.dioErrorHandle(e, stacktrace);
    }
  }
}
