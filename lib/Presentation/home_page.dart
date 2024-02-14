import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_api/models/models.dart';

import '../Custom/app_themes.dart';
import '../weather/weather_bloc.dart';

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
          return weatherView(state.weather, context);
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget weatherView(CurrentWeather weather, context) {
    return Scaffold(
      backgroundColor:
          weather.current!.isDay == 1 ? Colors.blue.shade200 : Colors.black54,
      body: RefreshIndicator(
        onRefresh: () async {
          print("refreshed");
          BlocProvider.of<WeatherBloc>(context)
              .add(const GetCurrentWeatherData(location: "Ahmedabad"));
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${weather.location!.name}',
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        color: ThemeHelper(isDay: weather.current!.isDay!)
                            .textColor),
                  ),
                  Text(
                    'Updated: ${weather.current!.lastUpdated!.substring(11)} ${int.parse(weather.current!.lastUpdated!.substring(11, 13)) >= 12 ? "PM" : "AM"}',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: ThemeHelper(isDay: weather.current!.isDay!)
                            .textColor),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.network(
                    "https:${weather.current!.condition!.icon!}",
                    scale: 0.5,
                  ),
                  Text(
                    '${weather.current!.tempC}°C',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: ThemeHelper(isDay: weather.current!.isDay!)
                            .textColor),
                  ),
                  Text(
                    '${weather.current!.condition!.text}',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: ThemeHelper(isDay: weather.current!.isDay!)
                            .textColor),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
