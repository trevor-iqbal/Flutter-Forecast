import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wheatherforecast/ui/forecast_details.dart';
import 'package:wheatherforecast/util/util.dart' as util;

Map content;
String BACKGROUND = background[2];
List<String> background = ['assets/background/day-image.png', 'assets/background/night-image.png', 'assets/background/sunset-image.png'];

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _latEntered, _longEntered;
  var _date;
  @override
  Widget build(BuildContext context) {
     return Scaffold(
        body: SafeArea(
           minimum: EdgeInsets.zero,
             child: getFutureBuilder(),
      )
    );
  }
  Future _goToNextScreen (BuildContext context) async{
      Map results = await Navigator.of(context).push(
        new MaterialPageRoute<Map>(
          builder: (BuildContext context){
            return Forecast();
          }
        )
      );
      if(results != null && results.containsKey('lat')){
          _latEntered = results['lat'];
      }
      if(results != null && results.containsKey('long')){
          _longEntered = results['long'];
      }
  }

  Widget getFutureBuilder(){
    return FutureBuilder(
               future: getDataPoint(_latEntered == null ? util.LAT :_latEntered, _longEntered == null ? util.LONG :_longEntered, util.UNITS),
               builder: (BuildContext context, AsyncSnapshot<Map> snapshot){
                 if(snapshot.hasData){
                    content = snapshot.data;
                    var formatPrimary =  DateFormat.d("en_US").add_E();
                    var formatSecondary =  DateFormat.jm("en_US");
                    _date = formatSecondary.format(
                        DateTime.fromMillisecondsSinceEpoch(
                            content["currently"]["time"] * 1000,
                            isUtc: true) ?? ['null']);
                   return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(BACKGROUND),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              IconButton(icon: Icon(Icons.insert_chart, color: Colors.white, size: 35.0), onPressed: (){ _goToNextScreen(context);})
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(content["timezone"].toString(), style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.w300)),
                              Text( content["currently"]["summary"].toString(), style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w300)),
                              Text( "Updated as of "+ _date, style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w300)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Row( 
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Image.asset("assets/icon/${content['currently']['icon']}.png"),
                                  Text(content["currently"]["temperature"].toString()+"°", style: TextStyle(color: Colors.white, fontSize: 110.0, letterSpacing: -10.0, fontWeight: FontWeight.w200)),
                                  ],
                              ),
                            ],
                          ),
                        Padding(padding: EdgeInsets.all(70.0)),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(padding: EdgeInsets.fromLTRB(0,10.0,0,0)),
                                Card(color: Colors.transparent,
                                      child: Column(
                                        children: <Widget>[
                                            SizedBox(
                                              height: 137.0, width: 80.0,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(formatPrimary.format(
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
                                              height: 137.0, width: 80.0,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(formatPrimary.format(
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
                                              height: 137.0, width: 80.0,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(formatPrimary.format(
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
                                              height: 137.0, width: 80.0,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(formatPrimary.format(
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
                          ])
                        ],
                      )
                   );
                 }
                 else{
                  return Center(
                    child: CircularProgressIndicator(backgroundColor: Colors.red,)
                  );
                 }
               }
             );
  }
}

Future<Map> getDataPoint(String lat, String long, String units) async{
  String apiUrl ="https://api.darksky.net/forecast/${util.APIKEY}/$lat,$long?units=$units";
  http.Response response = await http.get(apiUrl);
  var data = json.decode(response.body);
  return data;
}
