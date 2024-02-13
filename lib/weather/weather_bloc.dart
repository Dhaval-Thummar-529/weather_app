import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather_api/weather_api_model.dart';
import 'package:weather_repository/modals/weather_repository.dart';

part 'weather_state.dart';

part 'weather_event.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc({required this.weatherRepository}) : super(WeatherEmpty());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is GetCurrentWeatherData) {
      yield WeatherLoading();
      try {
        final weather =
            await weatherRepository.getCurrentWeather(event.location);
        yield WeatherLoaded(weather: weather);
      } catch (e) {
        yield WeatherError();
      }
    }
  }
}
