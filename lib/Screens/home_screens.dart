import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Models/wheathermodel.dart';
import 'package:weather_app/Screens/search_page.dart';
import 'package:weather_app/proveders/proveders_models.dart';

class HomeScreens extends StatefulWidget {
  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

WeatherModel? weatherdata;

class _HomeScreensState extends State<HomeScreens> {
  @override
  Widget build(BuildContext context) {
    weatherdata = Provider.of<WeatherProveders>(context).weatherdata;

    return Scaffold(
      appBar: AppBar(title: Text('Weather App'), centerTitle: true, actions: [
        IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Searchpage();
              }));
            },
            icon: Icon(Icons.search))
      ]),
      body: weatherdata == null
          ? Center(
              child: Container(
                child: Text(
                  'Try to see the weather Now',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                ),
              ),
            )
          : Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [weatherdata!.GetThemeColor(),
                      weatherdata!.GetThemeColor()[300]!,
                      weatherdata!.GetThemeColor()[100]!,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(
                    flex: 3,
                  ),
                  Text(
                    Provider.of<WeatherProveders>(context).cityname!.toUpperCase()!,
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  Text(  'update at : ${weatherdata!.date.hour}:${weatherdata!.date.minute}', style: TextStyle(fontSize: 30)),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(weatherdata!.GetIcon().toString()),
                      Text(
                        '${weatherdata!.temp.toInt()}',
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      Column(
                        children: [
                          Text(
                            'Maxtemp : ${weatherdata!.maxTemp.toInt()}',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            'Mintemp : ${weatherdata!.minTemp.toInt()}',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Spacer(),
                  Text(
                    weatherdata!.weatherStaTeName,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Spacer(
                    flex: 3,
                  ),
                ],
              ),
            ),
    );
  }
}
