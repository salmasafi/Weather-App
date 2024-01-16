import 'package:flutter/material.dart';
import 'package:weatherapp/main.dart';
import 'package:weatherapp/models/weather_model.dart';

//late Color colorTheme;

class WeatherInfoBody extends StatelessWidget {
  final WeatherModel weatherModel;

  const WeatherInfoBody({Key? key, required this.weatherModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [getColorTheme(weatherModel.weatherStatus)[400]!, getColorTheme(weatherModel.weatherStatus)[50]!],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            Text(
              'Updated at ${weatherModel.updatedAt.hour}:${weatherModel.updatedAt.minute}',
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 82,
                  width: 82,
                  child: Image.network(
                    'https:${weatherModel.image}',
                  ),
                ),
                Text(
                  '${weatherModel.currentTemp.round()}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 55,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'Maxtemp: ${weatherModel.maxTemp.round()}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Mintemp: ${weatherModel.minTemp.round()}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 80,
            ),
            Text(
              weatherModel.weatherStatus,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
