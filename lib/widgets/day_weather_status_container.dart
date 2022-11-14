import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class dayStatusContainer extends StatelessWidget {
  const dayStatusContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 60,
      child: Column(
        children: [
          Icon(Icons.cloudy_snowing,color: Color.fromRGBO(240, 225, 89, 1),),
          Text(
            '29ᵒc',
            style: TextStyle(
                color: Colors.white,
                height: 1.5,
                fontSize: 15,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
          Text(
            'Today',
            style: TextStyle(
                color: Colors.white,
                height: 1.5,
                fontSize: 15,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic),
          )
        ],
      ),
    );
  }
}
