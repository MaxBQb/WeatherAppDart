import 'package:floor/floor.dart';
import 'package:weather_app/core/data/local/dao/base_dao.dart';
import 'package:weather_app/features/geolocation/constants.dart';
import 'package:weather_app/features/geolocation/data/local/model/location_entity.dart';

@dao
abstract class LocationDao extends BaseDao<LocationEntity> {
  @Query('SELECT * FROM ${LocationConstants.locationTable} LIMIT 1')
  Future<LocationEntity?> getLocation();
}
