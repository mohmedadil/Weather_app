import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/Models/wheathermodel.dart';
import 'package:weather_app/Screens/home_screens.dart';

class WeatherServices {
  String baseurl = 'http://api.weatherapi.com/v1';
  String Key = '29be266d8303493b8d2151139231107';

  Future<WeatherModel?> Getweather({required String cityname}) async {
    WeatherModel? weather;
    try {
      var url = Uri.parse('$baseurl/forecast.json?key=$Key&q=$cityname');
      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);
      weather = WeatherModel.fromJson(data);
    } catch (e) {
      print(e);
    }
    ;
    return weather;
  }
}
