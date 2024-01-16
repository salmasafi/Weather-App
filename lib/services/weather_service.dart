// ignore_for_file: unused_local_variable

import 'package:dio/dio.dart';
import 'package:weatherapp/models/weather_model.dart';

class WeatherService {
  final Dio dio = Dio();

  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = 'c29333118a0a4db593b60509230105';

  Future<WeatherModel> getWeather({required cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');

      WeatherModel weatherModel = WeatherModel.fromjson(response.data);

      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ?? 'Oops, There\'s an error, Try again';
      throw Exception(errorMessage);
    }
    catch (e){
      throw Exception('Oops, There\'s an error, Try again');
    }
  }
}
