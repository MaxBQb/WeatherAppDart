import 'package:injectable/injectable.dart';
import 'package:weather_app/features/weather/domain/entities/weather.dart';

import '../dao/weather_dao.dart';
import '../model/weather_entity.dart';


abstract class LocalWeatherSource {
  Future<void> save(List<Weather> models);
  Future<List<Weather>> get();
}

@singleton
class LocalWeatherSourceImpl implements LocalWeatherSource {
  final WeatherDao dao;

  LocalWeatherSourceImpl(this.dao);

  @override
  Future<void> save(List<Weather> models) async {
    final converted = models.map((e) => WeatherEntity.fromModel(e)).toList();
    await dao.drop();
    for (int id = 0; id < converted.length; id++) {
      converted[id].id = id;
      await dao.insert(converted[id]);
    }
  }
  @override
  Future<List<Weather>> get() async {
    return dao.getAll().then((value) => value.map((e) => e.toModel()).toList());
  }
}
