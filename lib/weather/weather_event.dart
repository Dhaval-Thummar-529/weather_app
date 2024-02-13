part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class GetCurrentWeatherData extends WeatherEvent {
  final String location;
  const GetCurrentWeatherData({required this.location});

  @override
  List<Object?> get props => [];
}
