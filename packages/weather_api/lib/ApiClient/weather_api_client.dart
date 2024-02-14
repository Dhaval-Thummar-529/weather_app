import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:weather_api/weather_api_model.dart';

import '../models/forecast_weather.dart';

/// Exception thrown when getWeather fails.
class WeatherRequestFailure implements Exception {}

/// Exception thrown when weather for provided location is not found.
class WeatherNotFoundFailure implements Exception {}

class WeatherApiClient {
  final http.Client _httpClient;

  WeatherApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  static const APIKey = "3fe9f54ce6b448d3b0f102415220303";
  static const base_url = "api.weatherapi.com";

  //endpoints
  static const current = "/v1/current.json";
  static const forecast = "/v1/forecast.json";

  Future<CurrentWeather> getCurrentWeather({required String location}) async {
    var params = {"key": APIKey, "q": location, "aqi": "yes"};

    final weatherRequest = Uri.https(base_url, current, params);

    final weatherResponse = await _httpClient.get(weatherRequest);

    if (weatherResponse.statusCode != 200) {
      throw WeatherRequestFailure();
    }

    final currentWeatherJson =
        jsonDecode(weatherResponse.body) as Map<String, dynamic>;

    if (!currentWeatherJson.containsKey("current")) {
      throw WeatherNotFoundFailure();
    }

    return CurrentWeather.fromJson(currentWeatherJson);
  }

  Future<ForecastWeather> getForecaseWeather(
      {required String location, required String days}) async {
    var params = {
      "key": APIKey,
      "q": location,
      "days": days,
      "aqi": "yes",
      "alerts": "no"
    };

    final request = Uri.https(base_url, forecast, params);
    final forecastResponse = await _httpClient.get(request);

    if (forecastResponse.statusCode != 200) {
      throw WeatherRequestFailure();
    }

    final forecastWeatherJson =
        jsonDecode(forecastResponse.body) as Map<String, dynamic>;

    if (!forecastWeatherJson.containsKey("forecast")) {
      throw WeatherNotFoundFailure();
    }

    return ForecastWeather.fromJson(forecastWeatherJson);
  }
}
