import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/get_weather_cubit/get_weather_cubit.dart';
import '../main.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [getColorTheme(BlocProvider.of<GetWeatherCubit>(context).weatherModel?.weatherStatus,)[400]!, getColorTheme(BlocProvider.of<GetWeatherCubit>(context).weatherModel?.weatherStatus,)[50]!],
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'There is no weather 😔',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text(
                'Start searching now 🔍',
                style: TextStyle(
                  fontSize: 30,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
