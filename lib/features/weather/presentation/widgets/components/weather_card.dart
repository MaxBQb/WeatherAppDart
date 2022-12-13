import 'package:flutter/material.dart';
import 'package:weather_app/core/presentation/text/icon_text.dart';
import 'package:weather_app/features/weather/domain/entities/weather.dart';

class WeatherCard extends StatelessWidget {
  final Weather weather;

  const WeatherCard({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconText(
                  label: "Дата", value: weather.time, icon: Icons.access_time),
              SizedBox(height: 5),
              Text("Температура", style: const TextStyle(fontSize: 16)),
              Row(
                children: [
                  IconText(
                      label: "Max",
                      value: weather.temperatureMax,
                      icon: Icons.thermostat),
                  SizedBox(height: 10),
                  IconText(
                      label: "Min",
                      value: weather.temperatureMin,
                      icon: Icons.thermostat),
                ],
              ),
              SizedBox(height: 5),
              Text("По ощущениям", style: const TextStyle(fontSize: 16)),
              Row(
                children: [
                  IconText(
                      label: "Max",
                      value: weather.apparentTemperatureMax,
                      icon: Icons.thermostat),
                  SizedBox(width: 5),
                  IconText(
                      label: "Min",
                      value: weather.apparentTemperatureMin,
                      icon: Icons.thermostat),
                ],
              ),
              SizedBox(height: 5),
              Text("Положение солнца", style: const TextStyle(fontSize: 16)),
              Row(
                children: [
                  IconText(
                      label: "Восход",
                      value: weather.sunrise,
                      icon: Icons.sunny),
                  SizedBox(width: 5),
                  IconText(
                      label: "Закат",
                      value: weather.sunset,
                      icon: Icons.sunny_snowing),
                ],
              ),
              SizedBox(height: 5),
              Text("Осадки", style: const TextStyle(fontSize: 16)),
              Row(
                children: [
                  IconText(
                      label: "Дождь",
                      value: weather.rainSum,
                      icon: Icons.water_drop_rounded),
                  SizedBox(width: 5),
                  IconText(
                      label: "Снег",
                      value: weather.snowfallSum,
                      icon: Icons.ac_unit),
                ],
              ),
              SizedBox(height: 5),
              Text("Ветер", style: const TextStyle(fontSize: 16)),
              Column(
                children: [
                  IconText(
                      label: "Скорость",
                      value: weather.windSpeed,
                      icon: Icons.speed),
                  IconText(
                      label: "Направление",
                      value: weather.windDirection,
                      icon: Icons.air),
                ],
              ),
            ],
          ),
        ));
  }
}
