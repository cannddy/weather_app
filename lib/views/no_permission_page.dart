import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:location/location.dart';
import 'package:weather/views/deceider_view.dart';

class NoPermissionPage extends StatefulWidget {
  const NoPermissionPage({super.key});

  @override
  State<NoPermissionPage> createState() => _NoPermissionPageState();
}

class _NoPermissionPageState extends State<NoPermissionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Allow Permission to know weather info"),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DeceiderView(),
                    ),
                  );
                },
                child: Text("Allow access"))
          ],
        ),
      ),
    );
  }
}
