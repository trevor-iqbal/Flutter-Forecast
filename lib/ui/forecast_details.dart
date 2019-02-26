import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wheatherforecast/modal/timegraph.dart';
import 'package:wheatherforecast/util/util.dart';
import 'homepage.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Forecast extends StatefulWidget {
  @override
  _ForecastState createState() => _ForecastState();
}

class _ForecastState extends State<Forecast> {

  List<String> background = ['assets/background/day-image.png', 'assets/background/night-image.png', 'assets/background/sunset-image.png'];
  var format = DateFormat.d("en_US").add_E();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.zero,
             child:
             Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(BACKGROUND),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child:
                    Column( 
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                      IconButton(icon: Icon(Icons.arrow_back, color: Colors.white, size: 35.0), onPressed: (){ Navigator.pop(context);}),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        TimeSeriesChart(_getForecastData())
                      ],
                    ),
                    Row(
                      children: <Widget>[
                      MaterialButton( child: Image.asset('assets/icon/weather_download_34.png', width: 45.0, height: 45.0), onPressed: (){setToCelsius();}),
                      MaterialButton( child: Image.asset('assets/icon/weather_download_32.png', width: 45.0, height: 45.0), onPressed: (){setToFahrenheit();}),
                       ],
                    ),
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
                                          Image.asset('assets/icon/${content["daily"]["data"][0]["icon"]}.png', width: 47.0, height: 47.0),
                                          Row(
                                             mainAxisAlignment: MainAxisAlignment.center,
                                             children: <Widget>[
                                                Text(content["daily"]["data"][0]["temperatureMax"].toString().substring(0,2)+"°/", style: TextStyle(color: Colors.white, fontSize: 14.0)),
                                                Text(content["daily"]["data"][0]["temperatureMin"].toString().substring(0,1)+"°", style: TextStyle(color: Colors.white, fontSize: 13.0))
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
                                          Image.asset('assets/icon/${content["daily"]["data"][1]["icon"]}.png', width: 47.0, height: 47.0),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                             children: <Widget>[
                                                Text(content["daily"]["data"][1]["temperatureMax"].toString().substring(0,2)+"°/", style: TextStyle(color: Colors.white, fontSize: 14.0)),
                                                Text(content["daily"]["data"][1]["temperatureMin"].toString().substring(0,1)+"°", style: TextStyle(color: Colors.white, fontSize: 12.0))
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
                                          Image.asset('assets/icon/${content["daily"]["data"][2]["icon"]}.png', width: 47.0, height: 47.0),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                             children: <Widget>[
                                                Text(content["daily"]["data"][2]["temperatureMax"].toString().substring(0,2)+"°/", style: TextStyle(color: Colors.white, fontSize: 14.0)),
                                                Text(content["daily"]["data"][2]["temperatureMin"].toString().substring(0,1)+"°", style: TextStyle(color: Colors.white, fontSize: 12.0))
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
                                          Image.asset('assets/icon/${content["daily"]["data"][3]["icon"]}.png', width: 47.0, height: 47.0),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                             children: <Widget>[
                                                Text(content["daily"]["data"][3]["temperatureMax"].toString().substring(0,2)+"°/", style: TextStyle(color: Colors.white, fontSize: 14.0)),
                                                Text(content["daily"]["data"][3]["temperatureMin"].toString().substring(0,1)+"°", style: TextStyle(color: Colors.white, fontSize: 12.0))
                                             ])                              
                                          ],
                                      ),
                                    ),
                                ],
                              ), )

                      ],
                    ),
                  ]
                )
              )
    ), 
    floatingActionButton: FloatingActionButton(
                  tooltip: "Add Location",
                  backgroundColor:  Colors.black,
                    child : Icon(Icons.my_location),
                    onPressed: _windowOnTapping,
    ));
  }
  
List<charts.Series<TimeSeriesTemperature, DateTime>> _getForecastData() {
  var year = DateFormat.y("en_US");
  var month = DateFormat.m("en_US").add_E();
  var day = DateFormat.d("en_US").add_E();
  List<TimeSeriesTemperature> data;
  for(int c = 0; c < 17; c++){
    // data.insert(c,
    //   TimeSeriesTemperature( 
    //     DateTime((year.format(DateTime.fromMillisecondsSinceEpoch(int.parse(content['hourly']['data'][c]['time']) * 1000)) ?? ['null'],
    //              month.format(DateTime.fromMilllisecondsSinceEpoch(int.parse(content['hourly']['data'][c]['time']) * 1000)) ?? ['null'],
    //              day.format(DateTime.fromMilllisecondsSinceEpoch(int.parse(content['hourly']['data'][c]['time']) * 1000)) ?? ['null']),
    //              content['hourly']['data'][c]['temperature'])));
  }

  return [
    charts.Series<TimeSeriesTemperature, DateTime>( 
      id: 'Hourly',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (TimeSeriesTemperature temperature, _) => temperature.time,
      measureFn: (TimeSeriesTemperature temperature, _) => temperature.temperature,
      data: data,
    )
  ];
}
  void _windowOnTapping() {
      var _textEditingControllerLAT = TextEditingController();
      var _textEditingControllerLONG = TextEditingController();
      var alert =  AlertDialog(
        title: Text("City Co-ordinates"),
        content: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                    children: <Widget>[
                        TextField(
                        controller: _textEditingControllerLAT,
                        decoration: InputDecoration(hintText: 'Enter Latitude here'),
                        keyboardType: TextInputType.number,
                      ),
                      TextField(
                        controller: _textEditingControllerLONG,
                        decoration: InputDecoration(hintText: 'Enter Logitude here'),
                        keyboardType: TextInputType.number,
                      )
                    ]))
          ],
        ),
        actions: <Widget>[
            FlatButton(
              child: Text("Search", style: TextStyle(fontSize: 20.0)),
              onPressed: () {
                changeLocation(_textEditingControllerLAT.toString(), _textEditingControllerLONG.toString());
              })
            ],
      );
       showDialog(context: context, builder: (_){ return alert; });
      }
  void changeLocation(String LAT, String LONG){
    // setLAT(LAT);
    // setLONG(LONG);
    Navigator.pop(context,{ 'lat' : LAT, 'long' : LONG});
    print (LAT + ", "+LONG+"--------");
  }
}