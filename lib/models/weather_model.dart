class WeatherModel {
  final String cityName;
  final double currentTemp;
  final double maxTemp;
  final double minTemp;
  final String weatherStatus;
  final DateTime updatedAt;
  final String image;

  const WeatherModel({
    required this.image,
    required this.maxTemp,
    required this.minTemp,
    required this.cityName,
    required this.updatedAt,
    required this.currentTemp,
    required this.weatherStatus,
  });


  factory WeatherModel.fromjson(json){
    return WeatherModel(
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      cityName: json['location']['name'],
      updatedAt: DateTime.parse(json['current']['last_updated'],),
      currentTemp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      weatherStatus: json['forecast']['forecastday'][0]['day']['condition']['text'],
    );
  }
}
