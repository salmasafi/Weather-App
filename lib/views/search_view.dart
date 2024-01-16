import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherapp/main.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/services/weather_service.dart';


class SearchView extends StatelessWidget {
  SearchView({super.key});

  late String cityNameFromTextField;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a city'),
      ),
      body: Container(
        decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [getColorTheme(BlocProvider.of<GetWeatherCubit>(context).weatherModel?.weatherStatus,)[400]!, getColorTheme(BlocProvider.of<GetWeatherCubit>(context).weatherModel?.weatherStatus,)[50]!],
        ),
      ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                onChanged: (value) {
                  cityNameFromTextField = value;
                },
                onSubmitted: (value){
                  GetWeatherCubit getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
                    getWeatherCubit.getWeather(cityName: cityNameFromTextField);
                  Navigator.pop(context);
                },
                decoration: const InputDecoration(
                  hintText: 'Enter a ctiy name',
                  suffixIcon: Icon(Icons.search),
                  label: Text('Search a ctiy'),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 28, horizontal: 16),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    //borderSide: BorderSide(color: Colors.blueAccent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    //borderSide: BorderSide(color: Colors.blueAccent),
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.0987),
                      //offset: const Offset(0.0, 2.0),
                      //blurRadius: 5.0,
                    )
                  ]
                ),
                child: MaterialButton(
                  elevation: 800,
                  //color: Colors.blue,
                  onPressed: () async {
                    GetWeatherCubit getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
                    getWeatherCubit.getWeather(cityName: cityNameFromTextField);
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Search',
                    style: TextStyle(
                      //color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
