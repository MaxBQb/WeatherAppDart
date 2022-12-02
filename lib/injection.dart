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

import 'features/geolocation/constants.dart';

final sl = GetIt.I; // Service location

Future<void> init() async {
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
}
