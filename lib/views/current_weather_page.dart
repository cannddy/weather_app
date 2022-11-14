import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:weather/widgets/day_weather_status_container.dart';

class currentWeather extends StatefulWidget {
  const currentWeather({super.key});

  @override
  State<currentWeather> createState() => _currentWeatherState();
}

class _currentWeatherState extends State<currentWeather> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff547298),
      appBar: AppBar(
        backgroundColor: Color(0xff547298),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          Spacer(),
          Text(
            'Weather man',
            style: TextStyle(
              color: Colors.white,
              height: 2,
              fontSize: 25,
            ),
          ),
          Spacer(),
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
              children: [
                Center(
                  child: Text(
                    'Chennai',
                    
                    style: TextStyle(
                      
                      color: Colors.white,
                      height: 5,
                      fontSize: 45,
                    ),
                  ),
                  
                ),Center(
                   child: Text(
                    'Sunday, December 19, 2022',
                    
                    style: TextStyle(
                      color: Colors.white,
                      height: 1,
                      fontSize: 22,
                      fontWeight: FontWeight.w300,
                      
                    ),
                  ),
                ),
                Center(
                   child: Text(
                    '15ᵒc',
                    
                    style: TextStyle(
                      color: Colors.white,
                      height: 1.5,
                      fontSize: 100,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Center(
                   child: Text(
                    '-------------',
                    
                    style: TextStyle(
                      color: Colors.white,
                      height: 1,
                      fontSize: 50,
                      fontWeight: FontWeight.normal
                    ),
                  ),
                ),
                Center(
                   child: Text(
                    'Cloudy',
                    
                    style: TextStyle(
                      color: Colors.white,
                      height: 3.5,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                 Center(
                   child: Text(
                    '25ᵒc/25ᵒc',
                    
                    style: TextStyle(
                      color: Colors.white,
                      height: 1.5,
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                
                
              ],
            ),
          ),SizedBox(
            height: 210,
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder:(context, index) {
               
                  return const 
                   dayStatusContainer();
                  ;
              },
            )
          )
        ],
      ),
    );
  }
}
