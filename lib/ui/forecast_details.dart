import 'package:flutter/material.dart';

class Forecast extends StatefulWidget {
  @override
  _ForecastState createState() => _ForecastState();
}

class _ForecastState extends State<Forecast> {
  List<String> background = ['assets/background/day-image.png', 'assets/background/night-image.png', 'assets/background/sunset-image.png'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.zero,
             child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(background[0]),
                    fit: BoxFit.cover,
                  ),
                ),
      )
    ), 
    floatingActionButton: FloatingActionButton(
                  tooltip: "Add Item",
                  backgroundColor:  Colors.black,
                    child : Icon(Icons.my_location),
                    onPressed: (){}),
    );
  }
}