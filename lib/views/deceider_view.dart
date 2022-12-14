import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:weather/views/current_weather_page.dart';
import 'package:weather/views/no_permission_page.dart';

class DeceiderView extends StatefulWidget {
  const DeceiderView({super.key});

  @override
  State<DeceiderView> createState() => _DeceiderViewState();
}

class _DeceiderViewState extends State<DeceiderView> {
  Future<bool> accessPermission() async {
    Location location = Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    _serviceEnabled = await location.serviceEnabled();
    // debugPrint(_serviceEnabled);

    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
    }

    _permissionGranted = await location.hasPermission();
    // print(_permissionGranted);
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
    }
    if (_permissionGranted == PermissionStatus.deniedForever) {
      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Alert"),
          content: Text("Allow Permission for location"),
          actions: [
            TextButton(onPressed: ()=>Navigator.pop(context), child: Text("Allow"))
          ],
        ),
      );
    }
    if (_serviceEnabled && _permissionGranted == PermissionStatus.granted) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: accessPermission(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            // return Center(child: Text(snapshot.data.toString()));
            bool data = snapshot.data!;
            //print(data);
            if (data) {
              return const CurrentWeatherPage();
            } else {
              return const NoPermissionPage();
            }
          }
          if (snapshot.hasError) {
            return AlertDialog(
              title: const Text("Alert"),
              content: Text(snapshot.error.toString()),
            );
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
