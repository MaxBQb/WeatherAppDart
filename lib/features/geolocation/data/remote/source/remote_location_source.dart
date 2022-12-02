import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/core/data/remote/utils/exception.dart';
import 'package:weather_app/features/geolocation/constants.dart';
import 'package:weather_app/features/geolocation/domain/model/location.dart';

import '../model/location_dto.dart';

abstract class RemoteLocationSource {
  Future<Iterable<Location>> getLocationsByName(String location);
}

class RemoteLocationSourceImpl implements RemoteLocationSource {
  final Dio dio;

  RemoteLocationSourceImpl({required this.dio});

  @override
  Future<Iterable<Location>> getLocationsByName(String location) async {
    try {
      Response response;
      response = await dio.get("${LocationConstants.geoUrl}/search",
          queryParameters: {'name': location, 'language': 'ru'});
      log("RESPONSE$response");
      if (response.statusCode != 200) {
        throw ExceptionUtils.dioStatusCodeErrorHandle(response.statusCode);
      } else {
        return LocationDto.fromJson(response.data).toModel() ?? List.empty();
      }
    } on DioError catch (e, stacktrace) {
      log(stacktrace.toString());
      throw ExceptionUtils.dioErrorHandle(e, stacktrace);
    }
  }
}
