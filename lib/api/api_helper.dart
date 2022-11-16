import 'package:http/http.dart' as http;

String URL = "https://api.open-meteo.com/v1/forecast?latitude=13.03&longitude=80.22&timezone=GMT&daily=weathercode";
//&start_date=2022-11-16&end_date=2022-11-30

class ApiHelper {
  //Future<Map<String,dynamic>> 
  getWeatherInfo(DateTime date,DateTime endDate)async{
    var formattedDate = "${date.year}-${date.month}-${date.day}";
    var formattedEndDate = "${endDate.year}-${endDate.month}-${endDate.day}";
    Uri REQ_URL = Uri.parse("$URL&start_date=$date&end_date=$formattedEndDate");
    final result = await http.get(REQ_URL);
    print(result);
  }
}