import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:weather_app/features/geolocation/data/local/dao/location_dao.dart';
import 'package:weather_app/features/geolocation/data/local/model/location_entity.dart';
import 'package:weather_app/features/weather/data/local/dao/weather_dao.dart';

import '../../../../features/weather/data/local/model/weather_entity.dart';

part 'db.g.dart';

@Database(version: 1, entities: [LocationEntity, WeatherEntity])
abstract class DB extends FloorDatabase {
  LocationDao get locationDao;
  WeatherDao get weatherDao;
}
