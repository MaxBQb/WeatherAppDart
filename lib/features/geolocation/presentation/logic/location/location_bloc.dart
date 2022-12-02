part of 'bloc.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final LocationUseCases useCases;

  LocationBloc({required this.useCases}) : super(LocationInitial()) {
    on<FindLocationEvent>(_findLocationEvent);
    on<GetCurrentLocationEvent>(_getCurrentLocationEvent);
    on<SetLocationEvent>(_setLocationEvent);
    on<GetLocationEvent>(_getLocationEvent);
  }

  _findLocationEvent(FindLocationEvent event, emit) async {
    emit(LocationLoading());
    final result = await useCases.getByName(event.search);
    result.fold((failure) => emit(LocationError(failure: failure)),
        (success) => emit(LocationListLoaded(locations: success.toList())));
  }

  _getCurrentLocationEvent(GetCurrentLocationEvent event, emit) async {
    emit(LocationLoading());
    final result = await useCases.getCurrent();
    result.fold((failure) => emit(LocationError(failure: failure)),
        (success) => emit(LocationLoaded(location: success)));
  }

  _setLocationEvent(SetLocationEvent event, emit) async {
    emit(LocationLoading());
    final result = await useCases.set(event.location);
    result.fold((failure) => emit(LocationError(failure: failure)),
        (success) => emit(LocationLoaded(location: success)));
  }

  _getLocationEvent(GetLocationEvent event, emit) async {
    emit(LocationLoading());
    final result = await useCases.get();
    result.fold((failure) => emit(LocationError(failure: failure)),
        (success) => emit(LocationLoaded(location: success)));
  }
}
