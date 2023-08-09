import 'package:flutter/material.dart';

class WeatherModel {
  DateTime date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStaTeName;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStaTeName});

  factory WeatherModel.fromJson(dynamic data) {
    return WeatherModel(
        date: DateTime.parse(data['current']['last_updated']),
        temp: data['forecast']['forecastday'][0]['day']['avgtemp_c'],
        maxTemp: data['forecast']['forecastday'][0]['day']['maxtemp_c'],
        minTemp: data['forecast']['forecastday'][0]['day']['mintemp_c'],
        weatherStaTeName: data['forecast']['forecastday'][0]['day']['condition']
            ['text']);
  }
  @override
  String toString() {
    return 'temp= $temp , weatherStaTeName=$weatherStaTeName ';
  }

  String GetIcon() {
    if (weatherStaTeName == 'Clear' || weatherStaTeName == 'Light cloud') {
      return 'assets/images/clear.png';
    } else if (weatherStaTeName == 'Sleet' ||
        weatherStaTeName == 'Snow' ||
        weatherStaTeName == 'Hail') {
      return 'assets/images/snow.png';
    } else if (weatherStaTeName == 'Heavy cloud') {
      return 'assets/images/cloudy.png';
    } else if (weatherStaTeName == 'Light rain' ||
        weatherStaTeName == 'Heavy rain' ||
        weatherStaTeName == 'Partly cloudy' ||
        weatherStaTeName == 'Showers') {
      return 'assets/images/rainy.png';
    } else if (weatherStaTeName == 'Thunder' ||
        weatherStaTeName == 'Light rain' ||
        weatherStaTeName == 'Patchy rain possible') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor GetThemeColor() {
    if (weatherStaTeName == 'Clear' || weatherStaTeName == 'Light cloud') {
      return Colors.orange;
    } else if (weatherStaTeName == 'Sleet' ||
        weatherStaTeName == 'Snow' ||
        weatherStaTeName == 'Hail') {
      return Colors.blue;
    } else if (weatherStaTeName == 'Heavy cloud') {
      return Colors.blueGrey;
    } else if (weatherStaTeName == 'Light rain' ||
        weatherStaTeName == 'Heavy rain' ||
        weatherStaTeName == 'Partly cloudy' ||
        weatherStaTeName == 'Showers') {
      return Colors.blue;
    } else if (weatherStaTeName == 'Thunder' ||
        weatherStaTeName == 'Light rain' ||
        weatherStaTeName == 'Patchy rain possible' ||
        weatherStaTeName == 'Moderate rain') {
      return Colors.blueGrey;
    } else {
      return Colors.orange;
    }
  }
}
