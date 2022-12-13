part of 'bloc.dart';

@immutable
abstract class WeatherState extends Equatable {
  const WeatherState();
}
class WeatherInitial extends WeatherState {
  @override
  List<Object> get props => [];
}
class WeatherLoading extends WeatherState {
  @override
  List<Object> get props => [];
}
class WeatherLoaded extends WeatherState {
  final List<Weather> list;
  const WeatherLoaded({required this.list});
  @override
  List<Object> get props => [];
}
class WeatherError extends WeatherState {
  final Failure failure;
  const WeatherError({required this.failure});
  @override
  List<Object> get props => [];
}
