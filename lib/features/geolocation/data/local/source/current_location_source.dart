import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/data/remote/exceptions/exceptions.dart';
import 'package:weather_app/features/geolocation/domain/model/location.dart';

class CurrentLocationService {
  Future<Location> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error(
          LocationException('Служба определения местоположения отключена'));
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error(
            LocationException('Отказано в доступе к местоположению'));
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(LocationException(
          'Разрешение на определение местоположения полностью запрещено'));
    }
    Position position = await Geolocator.getCurrentPosition();
    return Location(
        latitude: position.latitude,
        longitude: position.longitude,
        timezone: "Europe/Moscow");
  }
}
