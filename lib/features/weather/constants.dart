class WeatherConstants {
  WeatherConstants._();

  static const weatherUrl = "https://api.open-meteo.com/v1";
  static const daily =
      "temperature_2m_max,temperature_2m_min,apparent_temperature_max,apparent_temperature_min,sunrise,sunset,rain_sum,snowfall_sum,windspeed_10m_max,winddirection_10m_dominant";
  static const windspeedUnit = 'ms';
  static const timeFormat = 'unixtime';
  static const weatherTable = "WeatherEntity";
}
