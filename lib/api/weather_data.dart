class WeatherData {
  List<String> time;
  List<int> weathercode;

  WeatherData({required this.time, required this.weathercode});

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      time: json["time"].cast<String>(),
      weathercode: json["weathercode"].cast<int>(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['weathercode'] = weathercode;
    return data;
  }
}
