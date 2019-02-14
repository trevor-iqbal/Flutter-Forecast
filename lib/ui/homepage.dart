import 'package:flutter/material.dart';
import 'package:wheatherforecast/ui/forecast_details.dart';

//clear-day, clear-night, rain, snow, sleet, wind, fog, cloudy, partly-cloudy-day, or partly-cloudy-night hail, thunderstorm, or tornado
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> background = ['assets/background/day-image.png', 'assets/background/night-image.png', 'assets/background/sunset-image.png'];
  List<String> icon = [];
  @override
  Widget build(BuildContext context) {
     return Scaffold(
        body: SafeArea(
           minimum: EdgeInsets.zero,
             child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(background[2]),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        IconButton(icon: Icon(Icons.add, color: Colors.white, size: 35.0), onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context) { return Forecast();})); },)
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Lahore, Punjab', style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w200)),
                        Text('Smoke', style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w300)),
                        Text('Time', style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w300)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text("13"+"°", style: TextStyle(color: Colors.white, fontSize: 125.0, letterSpacing: -12.0, fontWeight: FontWeight.w200)),
                            ],
                        ),
                        Column(
                          children: <Widget>[
                            // MaterialButton( child: Image.asset('assets/icon/weather_download_34.png', width: 45.0, height: 45.0), onPressed: (){}),
                            // MaterialButton( child: Image.asset('assets/icon/weather_download_32.png', width: 45.0, height: 45.0), onPressed: (){}),
                          ],
                        )
                      ],
                    ),
                    Padding(padding: EdgeInsets.all(40.0),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                         Card(color: Colors.transparent,
                        child: Column(
                          children: <Widget>[
                              SizedBox(
                                height: 95.0, width: 95.0,
                                child: Column(
                                  children: <Widget>[
                                    Image.asset('assets/icon/weather_download_30.png', width: 50.0, height: 50.0),
                                    Text('Humidity', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300,))
                                  ],
                                ),
                              ),
                           ],
                        ), ),
                        Card(color: Colors.transparent,
                        child: Column(
                          children: <Widget>[
                              SizedBox(
                                height: 95.0, width: 95.0,
                                child: Column(
                                  children: <Widget>[
                                    Image.asset('assets/icon/weather_download_07.png', width: 50.0, height: 50.0),
                                    Text('Wind', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300)),                                  
                                    ],
                                ),
                              ),
                           ],
                        ), ),
                        Card(color: Colors.transparent,
                        child: Column(
                          children: <Widget>[
                              SizedBox(
                                height: 95.0, width: 95.0,
                                child: Column(
                                  children: <Widget>[
                                    Image.asset('assets/icon/visibility-icon.png', width: 50.0, height: 50.0, color: Colors.white),
                                    Text('Visibility', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300)),
                                  ],
                                ),
                              ),
                           ],
                        ), ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Card(color: Colors.transparent,
                        child: Column(
                          children: <Widget>[
                              SizedBox(
                                height: 95.0, width: 95.0,
                                child: Column(
                                  children: <Widget>[
                                    Image.asset('assets/icon/dew-point-icon.png', width: 50.0, height: 50.0, color: Colors.white),
                                    Text('Dew Point', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300)),
                                  ],
                                ),
                              ),
                           ],
                        ), ),
                        Card(color: Colors.transparent,
                        child: Column(
                          children: <Widget>[
                              SizedBox(
                                height: 95.0, width: 95.0,
                                child: Column(
                                  children: <Widget>[
                                    Image.asset('assets/icon/pressure-icon.png', width: 50.0, height: 50.0, color: Colors.white),
                                    Text('Pressure', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300)),
                                  ],
                                ),
                              ),
                           ],
                        ), ),
                        Card(color: Colors.transparent,
                        child: Column(
                          children: <Widget>[
                              SizedBox(
                                height: 95.0, width: 95.0,
                                child: Column(
                                  children: <Widget>[
                                    Image.asset('assets/icon/uv-index-icon.png', width: 50.0, height: 50.0, color: Colors.white),
                                    Text('UV Index', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300)),
                                  ],
                                ),
                              ),
                           ],
                        ), ),
                      ],
                    )
                  ],
                )
      ),
      )
    );
  }
}
