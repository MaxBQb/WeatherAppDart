import 'package:injectable/injectable.dart';
import 'package:weather_app/features/geolocation/data/local/dao/location_dao.dart';
import 'package:weather_app/features/geolocation/data/local/model/location_entity.dart';
import 'package:weather_app/features/geolocation/domain/model/location.dart';

abstract class LocalLocationSource {
  Future<int> save(Location model);
  Future<Location?> get();
}

@singleton
class LocalLocationSourceImpl implements LocalLocationSource {
  final LocationDao dao;

  LocalLocationSourceImpl(this.dao);

  @override
  Future<int> save(Location model) async {
    return await dao.insert(LocationEntity.fromModel(model));
  }

  @override
  Future<Location?> get() {
    return dao.getLocation().then((e) => e?.toModel());
  }
}
