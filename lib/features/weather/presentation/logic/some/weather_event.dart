part of 'bloc.dart';

@immutable
abstract class WeatherEvent extends Equatable {}
class GetWeatherEvent extends WeatherEvent {
  GetWeatherEvent();
  @override
  List<Object?> get props => [];
}
