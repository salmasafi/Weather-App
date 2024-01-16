import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherapp/cubit/get_weather_cubit/get_weather_states.dart';
import 'package:weatherapp/views/search_view.dart';
import 'package:weatherapp/widgets/no_weather_body.dart';
import 'package:weatherapp/widgets/weather_info_body.dart';

import '../main.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Weather App'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchView()));
              },
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        body: BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is NoWeatherState) {
              return const NoWeatherBody();
            } else if (state is WeatherLoadedState) {
              return WeatherInfoBody(
                weatherModel: state.weatherModel,
              );
            } else if (state is WeatherFailedState) {
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      getColorTheme(
                        BlocProvider.of<GetWeatherCubit>(context)
                            .weatherModel
                            ?.weatherStatus,
                      )[400]!,
                      getColorTheme(
                        BlocProvider.of<GetWeatherCubit>(context)
                            .weatherModel
                            ?.weatherStatus,
                      )[50]!
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(26),
                  child: Center(
                    child: Text(state.errorMessage, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  ),
                ),
              );
            } else {
              return const NoWeatherBody();
            }
          },
        ));
  }
}
