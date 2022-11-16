import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/api/weather_data.dart';

//&start_date=2022-11-16&end_date=2022-11-30

class ApiHelper {
  //Future<Map<String,dynamic>> 
  Future<WeatherData> getWeatherInfo(double latitude,double longitude)async{
    String URL = "https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&timezone=GMT&daily=weathercode,temperature_2m_max";
    Uri REQ_URL = Uri.parse(URL);
    final result = await http.get(REQ_URL);
    final jsonData = json.decode(result.body)["daily"];
    WeatherData weatherData = WeatherData.fromJson(jsonData);
    return weatherData;
  }
}