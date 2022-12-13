class Weather {
  final String? time;
  final String? temperatureMax;
  final String? temperatureMin;
  final String? apparentTemperatureMax;
  final String? apparentTemperatureMin;
  final String? sunrise;
  final String? sunset;
  final String? rainSum;
  final String? snowfallSum;
  final String? windSpeed;
  final String? windDirection;

  const Weather({
    required this.time,
    required this.temperatureMax,
    required this.temperatureMin,
    required this.apparentTemperatureMax,
    required this.apparentTemperatureMin,
    required this.sunrise,
    required this.sunset,
    required this.rainSum,
    required this.snowfallSum,
    required this.windSpeed,
    required this.windDirection,
  });
}
