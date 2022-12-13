import 'package:dio/dio.dart';

class EndPointConfig {
  EndPointConfig._();

  static Options options = Options(
    headers: {
      'content-type': 'application/json',
    },
    receiveTimeout: 60 * 1000,
  );
}
