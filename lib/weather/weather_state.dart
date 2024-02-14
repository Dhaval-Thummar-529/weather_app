part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherEmpty extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final CurrentWeather weather;
  final ForecastWeather forecastWeather;

  const WeatherLoaded({required this.forecastWeather, required this.weather});

  @override
  List<Object> get props => [];
}

class WeatherError extends WeatherState {}

class ForecastWeatherEmpty extends WeatherState {}

class ForecastWeatherLoading extends WeatherState {}

class ForecastWeatherLoaded extends WeatherState {
  final ForecastWeather weather;

  const ForecastWeatherLoaded({required this.weather});

  @override
  List<Object> get props => [];
}

class ForecastWeatherError extends WeatherState {}
