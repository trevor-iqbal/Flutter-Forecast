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
  var format = DateFormat.jm("en_US");
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
                          IconButton(icon: Icon(Icons.arrow_back, color: Colors.white, size: 32.0), onPressed: (){ Navigator.pop(context);}),
                          ],
                        ),
                        SafeArea(
                          minimum: EdgeInsets.fromLTRB(0, 0, 0, 10.0),
                          child:
                            Container(
                              height: 190.0,
                              width: 550.0,
                              color: Colors.transparent,
                              child:
                        TimeSeriesChart(_getForecastData()))),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                            Tooltip(
                            message: 'Changed To Celsius',
                            child: MaterialButton( child: Image.asset('assets/icon/weather_download_34.png', width: 45.0, height: 45.0), onPressed: (){setToCelsius();})),
                            Tooltip(
                            message: 'Changed To Fahrenheit',
                            child: MaterialButton( child: Image.asset('assets/icon/weather_download_32.png', width: 45.0, height: 45.0), onPressed: (){setToFahrenheit();})),
                            ],
                          ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Day Details', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w300)),
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
                                          Image.asset('assets/icon/weather_download_30.png', width: 50.0, height: 50.0),
                                          Text(content['currently']['humidity'].toString()+"g/m3", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300,)),
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
                                          Image.asset('assets/icon/wind.png', width: 50.0, height: 50.0),
                                          Text(content['currently']['windSpeed'].toString()+" mph", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300,)),
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
                                          Text(content['currently']['visibility'].toString().substring(0,1)+" km", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300,)),
                                          Text('Visibility', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300))
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
                                          Text(content['currently']['dewPoint'].toString()+"°", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300,)),
                                          Text('Dew Point', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300))
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
                                          Text(content['currently']['pressure'].toString().substring(0,4)+" psi", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300,)),
                                          Text('Pressure', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300))
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
                                          Text(content['currently']['uvIndex'].toString()+" mW", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300,)),
                                          Text('UV Index', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300))
                                        ],
                                      ),
                                    ),
                                ],
                              ), ),
                            ],
                          ),
                  ]
                )
              )
    ), 
    // floatingActionButton: FloatingActionButton(
    //               tooltip: "Add Location",
    //               backgroundColor:  Colors.black,
    //                 child : Icon(Icons.my_location),
    //                 onPressed: _windowOnTapping,
    // ));
    );}
  
List<charts.Series<TimeSeriesTemperature, DateTime>> _getForecastData() {
  var format = DateFormat.yMd().add_jm();
  List<TimeSeriesTemperature> data = new List<TimeSeriesTemperature>(6);
  for(int c = 0; c <= 5; c++){
    var dateFormat = format.format(DateTime.fromMillisecondsSinceEpoch(
                            content['hourly']['data'][c]['time'] * 1000,
                            isUtc: true) ?? ['null']);
    var date = DateTime(int.parse(dateFormat.substring(5,9)),
                        int.parse(dateFormat.substring(2,4)),
                        int.parse(dateFormat.substring(0,1)),
                        int.parse(dateFormat.substring(10,11)),0);
    print(dateFormat);
    var timeSeries = TimeSeriesTemperature(date, content['hourly']['data'][c]['temperature']+0.0);
    data[c] = timeSeries;
   }
  return [
    charts.Series<TimeSeriesTemperature, DateTime>( 
      id: 'Hourly',
      colorFn: (_, __) => charts.MaterialPalette.white,
      domainFn: (TimeSeriesTemperature temperature, _) => temperature.time,
      measureFn: (TimeSeriesTemperature temperature, _) => temperature.temperature,
      data: data,
      areaColorFn: (_,__) => charts.MaterialPalette.white,
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
  void changeLocation(String lAT, String lONG){
    // setLAT(LAT);
    // setLONG(LONG);
    Navigator.pop(context,{ 'lat' : lAT, 'long' : lONG});
    print (lAT + ", "+lONG+"--------");
  }
}