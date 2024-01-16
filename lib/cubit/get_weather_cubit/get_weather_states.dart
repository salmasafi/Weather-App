import 'package:weatherapp/models/weather_model.dart';

class WeatherState {
  
}


class NoWeatherState extends WeatherState {
  
}

class WeatherLoadedState extends WeatherState{
  WeatherModel weatherModel;
  WeatherLoadedState({required this.weatherModel});
}

class WeatherFailedState extends WeatherState {
  final String errorMessage;

  WeatherFailedState({required this.errorMessage});
}