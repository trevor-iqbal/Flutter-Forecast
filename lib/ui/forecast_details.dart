import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'homepage.dart';


class Forecast extends StatefulWidget {
  @override
  _ForecastState createState() => _ForecastState();
}

class _ForecastState extends State<Forecast> {

  List<String> background = ['assets/background/day-image.png', 'assets/background/night-image.png', 'assets/background/sunset-image.png'];
  var format = DateFormat.d("en_US").add_E();
  void setToCelsius(){UNITS = "si";}
  void setToFahrenheit(){UNITS = "us";}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.zero,
             child:Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(BACKGROUND),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: 
                    Column( children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(padding: EdgeInsets.fromLTRB(0,10.0,0,0)),
                        Card(color: Colors.transparent,
                              child: Column(
                                children: <Widget>[
                                    SizedBox(
                                      height: 135.0, width: 80.0,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(format.format(
                                              DateTime.fromMillisecondsSinceEpoch(
                                                  content["daily"]["data"][0]["time"] * 1000,
                                                  isUtc: true) ?? ['null']), style: TextStyle(color: Colors.white, fontSize: 20.0)),
                                          Image.asset('assets/icon/${content["daily"]["data"][0]["icon"]}.png', width: 45.0, height: 45.0),
                                          Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceAround,
                                             children: <Widget>[
                                                Text(content["daily"]["data"][0]["temperatureMax"].toString()+"° ", style: TextStyle(color: Colors.white, fontSize: 14.0)),
                                                Text(content["daily"]["data"][0]["temperatureMin"].toString()+"°", style: TextStyle(color: Colors.white, fontSize: 13.0))
                                             ])                              
                                          ],
                                      ),
                                    ),
                                ],
                              ), ),
                        Card(color: Colors.transparent,
                              child: Column(
                                children: <Widget>[
                                    SizedBox(
                                      height: 135.0, width: 80.0,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(format.format(
                                              DateTime.fromMillisecondsSinceEpoch(
                                                  content["daily"]["data"][1]["time"] * 1000,
                                                  isUtc: true) ?? ['null']), style: TextStyle(color: Colors.white, fontSize: 20.0)),
                                          Image.asset('assets/icon/${content["daily"]["data"][1]["icon"]}.png', width: 45.0, height: 45.0),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                             children: <Widget>[
                                                Text(content["daily"]["data"][1]["temperatureMax"].toString()+"° ", style: TextStyle(color: Colors.white, fontSize: 14.0)),
                                                Text(content["daily"]["data"][1]["temperatureMin"].toString()+"°", style: TextStyle(color: Colors.white, fontSize: 12.0))
                                             ])                              
                                          ],
                                      ),
                                    ),
                                ],
                              ), ),
                        Card(color: Colors.transparent,
                              child: Column(
                                children: <Widget>[
                                    SizedBox(
                                      height: 135.0, width: 80.0,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(format.format(
                                              DateTime.fromMillisecondsSinceEpoch(
                                                  content["daily"]["data"][2]["time"] * 1000,
                                                  isUtc: true) ?? ['null']), style: TextStyle(color: Colors.white, fontSize: 20.0)),
                                          Image.asset('assets/icon/${content["daily"]["data"][2]["icon"]}.png', width: 45.0, height: 45.0),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                             children: <Widget>[
                                                Text(content["daily"]["data"][2]["temperatureMax"].toString()+"° ", style: TextStyle(color: Colors.white, fontSize: 14.0)),
                                                Text(content["daily"]["data"][2]["temperatureMin"].toString()+"°", style: TextStyle(color: Colors.white, fontSize: 12.0))
                                             ])                              
                                          ],
                                      ),
                                    ),
                                ],
                              ), ),
                         Card(color: Colors.transparent,
                              child: Column(
                                children: <Widget>[
                                    SizedBox(
                                      height: 135.0, width: 80.0,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(format.format(
                                              DateTime.fromMillisecondsSinceEpoch(
                                                  content["daily"]["data"][3]["time"] * 1000,
                                                  isUtc: true) ?? ['null']), style: TextStyle(color: Colors.white, fontSize: 20.0)),
                                          Image.asset('assets/icon/${content["daily"]["data"][3]["icon"]}.png', width: 45.0, height: 45.0),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                             children: <Widget>[
                                                Text(content["daily"]["data"][3]["temperatureMax"].toString()+"° ", style: TextStyle(color: Colors.white, fontSize: 14.0)),
                                                Text(content["daily"]["data"][3]["temperatureMin"].toString()+"°", style: TextStyle(color: Colors.white, fontSize: 12.0))
                                             ])                              
                                          ],
                                      ),
                                    ),
                                ],
                              ), )

                      ],
                    ),
                    Row(children: <Widget>[
                      MaterialButton( child: Image.asset('assets/icon/weather_download_34.png', width: 45.0, height: 45.0), onPressed: (){setToCelsius();}),
                      MaterialButton( child: Image.asset('assets/icon/weather_download_32.png', width: 45.0, height: 45.0), onPressed: (){setToFahrenheit();}),
                       ],
                    )
                  ]
                )
              )
    ), 
    floatingActionButton: FloatingActionButton(
                  tooltip: "Add Location",
                  backgroundColor:  Colors.black,
                    child : Icon(Icons.my_location),
                    onPressed: (){ }),
    );
  }
}