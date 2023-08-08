import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Models/wheathermodel.dart';
import 'package:weather_app/Screens/home_screens.dart';
import 'package:weather_app/proveders/proveders_models.dart';
import 'package:weather_app/services/weather_services.dart';

class Searchpage extends StatelessWidget {
  String? cityname;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
            onChanged: (data) {
              cityname = data;
            },
            onSubmitted: (data) async {
              cityname = data;
              Provider.of<WeatherProveders>(context, listen: false).cityname =
                  cityname;

              var getweather = WeatherServices();
              WeatherModel? weather =
                  await getweather.Getweather(cityname: data);
              Provider.of<WeatherProveders>(context, listen: false)
                  .weatherdata = weather;
              Navigator.pop(context);
            },
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                label: Text('search '),
                border: OutlineInputBorder(),
                hintText: 'search for city',
                suffixIcon: GestureDetector(
                    onTap: () async {
                      Provider.of<WeatherProveders>(context, listen: false)
                          .cityname = cityname;

                      var getweather = WeatherServices();
                      WeatherModel? weather =
                          await getweather.Getweather(cityname: cityname!);
                      Provider.of<WeatherProveders>(context, listen: false)
                          .weatherdata = weather;
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.search))),
          ),
        ),
      ),
    );
  }
}
