import 'package:flutter/material.dart';
import 'package:wheatherforecast/ui/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Forecast',
      home: MyHomePage(title: 'Weather Forecast'),
      debugShowCheckedModeBanner: false
    );
  }
}