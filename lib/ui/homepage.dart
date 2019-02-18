import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wheatherforecast/ui/forecast_details.dart';

//https://dribbble.com/shots/2332668-Lonely-Mountain-Weather-Concept?utm_source=Clipboard_Shot&utm_campaign=Marina_Matijaca&utm_content=Lonely%20Mountain%20Weather%20Concept&utm_medium=Social_Share
Map content;
String UNITS = "si"; //Default Celcious
String BACKGROUND = background[2];
List<String> background = ['assets/background/day-image.png', 'assets/background/night-image.png', 'assets/background/sunset-image.png'];

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
     return Scaffold(
        body: SafeArea(
           minimum: EdgeInsets.zero,
             child: FutureBuilder(
               future: getDataPoint(),
               builder: (BuildContext context, AsyncSnapshot<Map> snapshot){
                 if(snapshot.hasData){
                    content = snapshot.data;
                    var format = DateFormat.jm("en_US");
                    var _date = format.format(
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
                              IconButton(icon: Icon(Icons.add, color: Colors.white, size: 35.0), onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context) { return Forecast();})); },)
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(content["timezone"].toString(), style: TextStyle(color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.w300)),
                              Text( content["currently"]["summary"].toString(), style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w300)),
                              Text( "Updated as of "+_date, style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w300)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Row( 
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Image.asset("assets/icon/${content['currently']['icon']}.png"),
                                  Text(content["currently"]["temperature"].toString()+"°", style: TextStyle(color: Colors.white, fontSize: 110.0, letterSpacing: -10.0, fontWeight: FontWeight.w200)),
                                  ],
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.all(45.0),),
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
                                          Image.asset('assets/icon/weather_download_07.png', width: 50.0, height: 50.0),
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
                                          Text(content['currently']['visibility'].toString()+" km", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300,)),
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
                                          Text(content['currently']['pressure'].toString()+" psi", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300,)),
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
                          )
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
             )
      )
    );
  }
}

Future<Map> getDataPoint() async{
  String apiUrl ="https://api.darksky.net/forecast/97fffd1b9727d10dec8566dc63d34fc7/31.49,74.30?units=$UNITS";
  http.Response response = await http.get(apiUrl);
  var data = json.decode(response.body);
  return data;
}
// String backgroundSelecter(){
//   var format = DateFormat.jm("en_US");
//   var _date = format.format(
//       DateTime.fromMillisecondsSinceEpoch(
//           content["currently"]["time"] * 1000,
//           isUtc: true) ?? ['null']);
//   var entity = DateTime.fromMillisecondsSinceEpoch(
//           content["currently"]["time"] * 1000,
//           isUtc: true) ?? ['null'];
//   if(compareTo(entity)){

//   }
// }