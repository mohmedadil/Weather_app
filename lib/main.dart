import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Models/wheathermodel.dart';
import 'package:weather_app/Screens/home_screens.dart';
import 'package:weather_app/proveders/proveders_models.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) {
        return WeatherProveders();
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  WeatherModel? weather;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch:
              Provider.of<WeatherProveders>(context).weatherdata == null
                  ? Colors.blue
                  : Provider.of<WeatherProveders>(context)
                      .weatherdata!
                      .GetThemeColor()),
      home: HomeScreens(),
      debugShowCheckedModeBanner: false,
    );
  }
}
