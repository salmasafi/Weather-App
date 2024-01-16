// ignore_for_file: unused_import

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubit/get_weather_cubit/get_weather_states.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/widgets/no_weather_body.dart';
import '../../services/weather_service.dart';
import '../../views/search_view.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  WeatherModel? weatherModel;
  GetWeatherCubit() : super(NoWeatherState());

  getWeather({required String cityName}) async {
    try {
      weatherModel =
          await WeatherService().getWeather(cityName: cityName);
      emit(WeatherLoadedState(weatherModel: weatherModel!));
    } on Exception catch (e) {
      emit(WeatherFailedState(errorMessage: e.toString()));
      return const NoWeatherBody() ;
    }
  }
}
