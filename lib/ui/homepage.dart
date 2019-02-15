import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wheatherforecast/data/data_repository.dart';
import 'package:wheatherforecast/ui/forecast_details.dart';
 
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> background = ['assets/background/day-image.png', 'assets/background/night-image.png', 'assets/background/sunset-image.png'];
  @override
  Widget build(BuildContext context) {
     return Scaffold(
        body: SafeArea(
           minimum: EdgeInsets.zero,
             child: FutureBuilder(
               future: getDataPoint(),
               builder: (BuildContext context, AsyncSnapshot<Map> snapshot){
                 if(snapshot.hasData){
                   Map content = snapshot.data;
                    var format = DateFormat.MMM("en_US").add_jm();
                    var _date = format.format(
                      
                        DateTime.fromMillisecondsSinceEpoch(
                            content["currently"]["time"] * 1000,
                            isUtc: true) ?? ['null']);
                   return Container(
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
                              Text(content["timezone"].toString(), style: TextStyle(color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.w300)),
                              Text( content["currently"]["summary"].toString(), style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w300)),
                              Text( "Updated as of "+_date, style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w300)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Image.asset("assets/icon/clear-day.png"),
                                  Text(content["currently"]["temperature"].toString()+"°", style: TextStyle(color: Colors.white, fontSize: 115.0, letterSpacing: -10.0, fontWeight: FontWeight.w200)),
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
                                          Text(content['currently']['dewPoint'].toString()+"°", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300,)),
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
                                          Text(content['currently']['pressure'].toString()+" psi", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300,)),
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
                                          Text(content['currently']['uvIndex'].toString()+" mW", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300,)),
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
                   );
                 }
                 else{
                  return Center(
                    child: CircularProgressIndicator(backgroundColor: Colors.red,)//FadingText("..."),
                  );
                 }
               }
             )
      )
    );
  }
}
