class WeatherData {
  List<String> time;
  List<int> weathercode;
  List<double> temperature_2mMax;

  WeatherData({required this.time, required this.weathercode,required this.temperature_2mMax});

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      time: json["time"].cast<String>(),
      weathercode: json["weathercode"].cast<int>(),
      temperature_2mMax: json["temperature_2m_max"].cast<double>(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['weathercode'] = weathercode;
    data['temperature_2m_max'] = temperature_2mMax;
    return data;
  }
}
