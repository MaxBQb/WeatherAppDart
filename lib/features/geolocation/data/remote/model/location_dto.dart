import '../../../domain/model/location.dart';

class LocationDto {
  List<Results>? results;

  LocationDto({this.results});

  LocationDto.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }

  List<Location>? toModel() {
    return results
        ?.map((e) => Location(
            latitude: e.latitude!,
            longitude: e.longitude!,
            name: e.name,
            country: e.country,
            timezone: e.timezone))
        .toList();
  }
}

class Results {
  String? name;
  double? latitude;
  double? longitude;
  String? country;
  String? timezone;

  Results({this.name, this.latitude, this.longitude, this.timezone, this.country});

  Results.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? "???";
    latitude = json['latitude'] ?? 53.1585;
    longitude = json['longitude'] ?? 48.4681;
    country = json['country'] ?? "???";
    timezone = json['timezone'] ?? "Europe/Moscow";
  }
}
