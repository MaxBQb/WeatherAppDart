part of 'bloc.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherUseCases useCases;
  WeatherBloc({required this.useCases}) : super(WeatherInitial()) {
    on<GetWeatherEvent>(_getDataEvent);
  }
  _getDataEvent(GetWeatherEvent event, emit) async {
    emit(WeatherLoading());
    final result = await useCases.get();
    result.fold((failure) => emit(WeatherError(failure: failure)),
        (success) => emit(WeatherLoaded(list: success)));
  }
}
