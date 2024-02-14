import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/weather/weather_bloc.dart';
import 'package:weather_api/ApiClient/weather_api_client.dart';
import 'package:weather_repository/modals/weather_repository.dart';
import 'package:http/http.dart' as http;

import 'Custom/app_themes.dart';
import 'Presentation/home_page.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc<dynamic, dynamic> bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

void main() {
  Bloc.observer = SimpleBlocObserver();

  final WeatherRepository repository = WeatherRepository(
    weatherApiClient: WeatherApiClient(
      httpClient: http.Client(),
    ),
  );

  runApp(App(
    weatherRepository: repository,
  ));
}

class App extends StatelessWidget {
  final WeatherRepository weatherRepository;

  const App({Key? key, required this.weatherRepository}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quote App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Weather App'),
          centerTitle: true,
        ),
        body: BlocProvider(
          create: (context) =>
              WeatherBloc(weatherRepository: weatherRepository),
          child: HomePage(),
        ),
      ),
    );
  }
}
