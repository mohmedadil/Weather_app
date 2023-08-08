import 'package:flutter/widgets.dart';
import 'package:weather_app/Models/wheathermodel.dart';

class WeatherProveders extends ChangeNotifier {
  String? cityname;
  WeatherModel? _weatherdata;
  set weatherdata(WeatherModel? weather) {
    _weatherdata = weather;
    notifyListeners();
  }

  WeatherModel? get weatherdata => _weatherdata;
}
