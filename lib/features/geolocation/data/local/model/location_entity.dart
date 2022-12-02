import 'package:floor/floor.dart';
import 'package:weather_app/features/geolocation/domain/model/location.dart';

@Entity(tableName: "LocationEntity")
class LocationEntity {
  @PrimaryKey()
  final int id = 1;
  final double latitude;
  final double longitude;
  final String? name;
  final String? country;
  final String? timezone;

  const LocationEntity({
    required this.latitude,
    required this.longitude,
    required this.timezone,
    this.name,
    this.country,
  });

  Location toModel() => Location(
      latitude: latitude,
      longitude: longitude,
      name: name,
      country: country,
      timezone: timezone);

  LocationEntity.fromModel(Location l)
      : this(
            latitude: l.latitude,
            longitude: l.longitude,
            name: l.name,
            country: l.country,
            timezone: l.timezone);
}
