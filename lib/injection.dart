import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/core/data/local/db/db.dart';
import 'package:weather_app/features/geolocation/data/local/source/current_location_source.dart';
import 'package:weather_app/features/geolocation/data/local/source/local_location_source.dart';
import 'package:weather_app/features/geolocation/data/remote/source/remote_location_source.dart';
import 'package:weather_app/features/geolocation/data/repositories/location_repository_impl.dart';
import 'package:weather_app/features/geolocation/domain/repositories/location_repository.dart';
import 'package:weather_app/features/geolocation/domain/usecases/location_usecases.dart';
import 'package:weather_app/features/geolocation/presentation/logic/location/bloc.dart';
import 'package:weather_app/features/weather/data/local/source/local_weather_source.dart';
import 'package:weather_app/features/weather/data/remote/source/remote_weather_source.dart';
import 'package:weather_app/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:weather_app/features/weather/domain/repositories/weather_repository.dart';
import 'package:weather_app/features/weather/domain/usecases/weather_usecases.dart';

import 'features/geolocation/constants.dart';
import 'features/weather/constants.dart';
import 'features/weather/presentation/logic/some/bloc.dart';

final sl = GetIt.I; // Service location

Future<void> init() async {
  sl.registerFactory(() => WeatherBloc(useCases: sl()));
  sl.registerFactory(() => WeatherUseCases(repository: sl(), useCases: sl()));
  sl.registerFactory<WeatherRepository>(
      () => WeatherRepositoryImpl(remote: sl(), local: sl()));

  sl.registerFactory<RemoteWeatherSource>(() => RemoteWeatherSourceImpl(
          dio: Dio(BaseOptions(
        baseUrl: WeatherConstants.weatherUrl,
        receiveDataWhenStatusError: true,
        headers: {
          'content-type': 'application/json',
        },
        connectTimeout: 60 * 1000,
        receiveTimeout: 60 * 1000,
      ))));


  sl.registerFactory(() => LocationBloc(useCases: sl()));
  sl.registerFactory(() => LocationUseCases(repository: sl()));
  sl.registerFactory<LocationRepository>(
      () => LocationRepositoryImpl(remote: sl(), local: sl(), current: sl()));

  sl.registerFactory<RemoteLocationSource>(() => RemoteLocationSourceImpl(
          dio: Dio(BaseOptions(
        baseUrl: LocationConstants.geoUrl,
        receiveDataWhenStatusError: true,
        headers: {
          'content-type': 'application/json',
        },
        connectTimeout: 60 * 1000,
        receiveTimeout: 60 * 1000,
      ))));
  sl.registerFactory(() => CurrentLocationService());
  DB db = await $FloorDB.databaseBuilder('database').build();
  sl.registerFactory<LocalLocationSource>(
      () => LocalLocationSourceImpl((db.locationDao)));
  sl.registerFactory<LocalWeatherSource>(
      () => LocalWeatherSourceImpl((db.weatherDao)));
}
