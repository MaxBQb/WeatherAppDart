import 'package:floor/floor.dart';
import 'package:weather_app/features/weather/constants.dart';
import 'package:weather_app/features/weather/data/local/model/weather_entity.dart';

import '../../../../../core/data/local/dao/base_dao.dart';

@dao
abstract class WeatherDao extends BaseDao<WeatherEntity> {
  @Query('SELECT * FROM ${WeatherConstants.weatherTable}')
  Future<List<WeatherEntity>> getAll();

  @Query('DELETE FROM ${WeatherConstants.weatherTable}')
  Future<void> drop();
}
