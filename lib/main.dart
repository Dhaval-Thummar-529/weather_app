import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/weather/weather_bloc.dart';
import 'package:weather_api/ApiClient/weather_api_client.dart';
import 'package:weather_repository/modals/weather_repository.dart';
import 'package:http/http.dart' as http;

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
        appBar: AppBar(title: const Text('Weather App')),
        body: BlocProvider(
          create: (context) =>
              WeatherBloc(weatherRepository: weatherRepository),
          child: HomePage(),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  late WeatherBloc weatherBloc;

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherEmpty) {
          BlocProvider.of<WeatherBloc>(context)
              .add(const GetCurrentWeatherData(location: "Ahmedabad"));
        }
        if (state is WeatherError) {
          return const Center(
            child: Text("Failed to fetch Weather Info!"),
          );
        }
        if (state is WeatherLoaded) {
          return ListTile(
            title: Text(
              '${state.weather.location!.name}',
              style: const TextStyle(fontSize: 10.0),
            ),
            subtitle: Text('${state.weather.current!.tempC}'),
            isThreeLine: true,
            dense: true,
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
