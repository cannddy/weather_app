import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:weather/views/current_weather_page.dart';

class DeceiderView extends StatefulWidget {
  const DeceiderView({super.key});

  @override
  State<DeceiderView> createState() => _DeceiderViewState();
}

class _DeceiderViewState extends State<DeceiderView> {
  Location location = Location();
  Future<LocationData?> getData() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
    }
    _locationData = await location.getLocation();
    return _locationData;
  }

  Future<bool> AccessPermission() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    print(_serviceEnabled);
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
    }

    _permissionGranted = await location.hasPermission();
    print(_permissionGranted.name);
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
    }
    return _serviceEnabled;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: AccessPermission(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: const CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            // return Center(child: Text(snapshot.data.toString()));
            bool _data = snapshot.data!;
            print(_data);
            if (_data) {
              return CurrentWeatherPage();
            } else {
              return Scaffold();
            }
          }
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return const Text("No data");
        });
  }
}
