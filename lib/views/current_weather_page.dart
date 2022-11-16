import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:location/location.dart';
import 'package:weather/api/api_helper.dart';
import 'package:weather/api/weather_data.dart';
import 'package:weather/views/no_permission_page.dart';
import 'package:weather/widgets/day_weather_status_container.dart';

class CurrentWeatherPage extends StatefulWidget {
  const CurrentWeatherPage({super.key});

  @override
  State<CurrentWeatherPage> createState() => _CurrentWeatherPageState();
}

class _CurrentWeatherPageState extends State<CurrentWeatherPage> {
  var dt = DateTime.now();

  Future<WeatherData?> getData() async {
    Location location = Location();
    LocationData locationData = await location.getLocation();
    ApiHelper apiHelper = ApiHelper();
    WeatherData weatherData = await apiHelper.getWeatherInfo(locationData.latitude!,locationData.longitude!);
    return weatherData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              WeatherData data = snapshot.data!;
    
              return CurrentWeatherDashboard(weatherData: data,);
            }
            if (snapshot.hasError) {
              return AlertDialog(
                title: const Text("Some error"),
                content: Text(snapshot.error.toString()),
              );
            }
            return const Center(child: Text("Getting your weather info"));
          }),
    );

  }
}




class CurrentWeatherDashboard extends StatefulWidget {
  final WeatherData weatherData;
  const CurrentWeatherDashboard({super.key, required this.weatherData});

  @override
  State<CurrentWeatherDashboard> createState() => _CurrentWeatherDashboardState();
}

class _CurrentWeatherDashboardState extends State<CurrentWeatherDashboard> {
  @override
  Widget build(BuildContext context) {
        return Scaffold(
      backgroundColor: Color(0xff547298),
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        backgroundColor: Color(0xff547298),
        elevation: 0,
        centerTitle: true,
        title: Text("Weather man"),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        actions: [
          IconButton(
            icon: Icon(Icons.add_circle_outline_rounded),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            //color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Chennai',
                  style: TextStyle(
                    color: Colors.white,
                    height: 5,
                    fontSize: 45,
                  ),
                ),
                Text(
                  'Sunday, December 19, 2022',
                  style: TextStyle(
                    color: Colors.white,
                    height: 1,
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  '15ᵒc',
                  style: TextStyle(
                      color: Colors.white,
                      height: 1.5,
                      fontSize: 100,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '-------------',
                  style: TextStyle(
                      color: Colors.white,
                      height: 1,
                      fontSize: 50,
                      fontWeight: FontWeight.normal),
                ),
                Text(
                  'Cloudy',
                  style: TextStyle(
                      color: Colors.white,
                      height: 3.5,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                //hi
                Text(
                  '25ᵒc/25ᵒc',
                  style: TextStyle(
                      color: Colors.white,
                      height: 1.5,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 110,
                )
              ],
            ),
          ),
          Spacer(),
          SizedBox(
            height: 100,
            child: ListView.separated(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return SizedBox(width: 50,);
              },
              itemBuilder: (context, index) {
                return const dayStatusContainer();
              },
            ),
          )
        ],
      ),
    );
  }
}
