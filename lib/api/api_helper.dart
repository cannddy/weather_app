import 'dart:convert';

import 'package:http/http.dart' as http;

//&start_date=2022-11-16&end_date=2022-11-30

class ApiHelper {
  //Future<Map<String,dynamic>> 
  getWeatherInfo(double latitude,double longitude)async{
    String URL = "https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&timezone=GMT&daily=weathercode";
    Uri REQ_URL = Uri.parse(URL);
    final result = await http.get(REQ_URL);
    final info = json.decode(result.body)["daily"];
    print(info);
    return info;
  }
}