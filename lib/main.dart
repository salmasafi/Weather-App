import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherapp/cubit/get_weather_cubit/get_weather_states.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/services/weather_service.dart';
import 'package:weatherapp/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) {
          return BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
              return MaterialApp(
                theme: ThemeData(
                  /* colorScheme: ColorScheme.fromSwatch(
                    primarySwatch: getColorTheme(
                        BlocProvider.of<GetWeatherCubit>(context)
                            .weatherModel
                            ?.weatherStatus),
                  ), */
                  appBarTheme: AppBarTheme(
                    color: getColorTheme(
                      BlocProvider.of<GetWeatherCubit>(context)
                          .weatherModel
                          ?.weatherStatus,
                    )[400],
                  ),
                  /* inputDecorationTheme: InputDecorationTheme(
                    labelStyle: TextStyle(
                      color: getColorTheme(
                        BlocProvider.of<GetWeatherCubit>(context)
                            .weatherModel
                            ?.weatherStatus,
                      ),
                    ),
                  ), */
                  buttonTheme: ButtonThemeData(
                    buttonColor: getColorTheme(
                      BlocProvider.of<GetWeatherCubit>(context)
                          .weatherModel
                          ?.weatherStatus,
                    ),
                  ),
                ),
                debugShowCheckedModeBanner: false,
                home: const HomeView(),
              );
            },
          );
        },
      ),
    );
  }
}

MaterialColor getColorTheme(String? condition) {
  if (condition == null) {
    return Colors.teal;
  }
  switch (condition) {
    case 'Sunny':
      return Colors.amber;
    case 'Partly cloudy':
    case 'Cloudy':
    case 'Overcast':
      return Colors.grey;
    case 'Mist':
    case 'Fog':
    case 'Freezing fog':
      return Colors.blueGrey;
    case 'Patchy rain possible':
    case 'Light rain':
    case 'Moderate rain':
    case 'Heavy rain':
    case 'Light rain shower':
    case 'Moderate or heavy rain shower':
    case 'Torrential rain shower':
      return Colors.blue;
    case 'Patchy snow possible':
    case 'Patchy sleet possible':
    case 'Patchy freezing drizzle possible':
    case 'Blowing snow':
    case 'Blizzard':
    case 'Patchy light snow':
    case 'Light snow':
    case 'Patchy moderate snow':
    case 'Moderate snow':
    case 'Patchy heavy snow':
    case 'Heavy snow':
    case 'Light snow showers':
    case 'Moderate or heavy snow showers':
      return Colors.grey;
    case 'Thundery outbreaks possible':
    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
    case 'Patchy light snow with thunder':
    case 'Moderate or heavy snow with thunder':
      return Colors.deepPurple;
    case 'Freezing drizzle':
    case 'Heavy freezing drizzle':
    case 'Moderate or heavy freezing rain':
    case 'Light sleet':
    case 'Moderate or heavy sleet':
    case 'Light sleet showers':
    case 'Moderate or heavy sleet showers':
      return Colors.blueGrey;
    case 'Light drizzle':
    case 'Light freezing rain':
    case 'Light showers of ice pellets':
      return Colors.lightBlue;
    case 'Moderate rain at times':
    case 'Heavy rain at times':
      return Colors.indigo;
    case 'Ice pellets':
    case 'Moderate or heavy showers of ice pellets':
      return Colors.blue;
    default:
      return Colors.teal;
  }
}
