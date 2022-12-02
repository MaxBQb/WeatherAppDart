class Location {
  final double latitude;
  final double longitude;
  final String? name;
  final String? country;
  final String? timezone;

  const Location({
    required this.latitude,
    required this.longitude,
    required this.timezone,
    this.name,
    this.country,
  });
}
