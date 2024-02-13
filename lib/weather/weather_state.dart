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

  const WeatherLoaded({required this.weather});

  @override
  List<Object> get props => [];
}

class WeatherError extends WeatherState {}
