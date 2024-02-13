import 'package:weather_repository/weather_repository.dart';

class WeatherRepository {
  final WeatherApiClient _weatherApiClient;

  WeatherRepository({WeatherApiClient? weatherApiClient})
      : _weatherApiClient = weatherApiClient ?? WeatherApiClient();

  Future<CurrentWeather> getCurrentWeather(String location) async {
    final currentWeather =
        await _weatherApiClient.getCurrentWeather(location: location);

    return CurrentWeather(location: currentWeather.location, current: currentWeather.current);
  }
}
