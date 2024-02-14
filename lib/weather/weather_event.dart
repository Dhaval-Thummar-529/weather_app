part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class GetCurrentWeatherData extends WeatherEvent {
  final String location;
  final String days;

  const GetCurrentWeatherData({required this.location, required this.days});

  @override
  List<Object?> get props => [];
}

class GetForecastWeatherData extends WeatherEvent {
  final String location;
  final String days;

  const GetForecastWeatherData({required this.location, required this.days});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
