import 'package:flutter/material.dart';
import 'package:wheatherforecast/data/data_repository.dart';

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
             child: 
             FutureBuilder(
               future: getDataPoint(),
               builder:  (BuildContext context, AsyncSnapshot<Map> snapshot){
                 if(snapshot.hasData){
                   Map content = snapshot.data;
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(background[1]),
                        fit: BoxFit.cover,
                      ),
                    ),
              );
            }
            else{
                return Container();
            }
          }
          )
    ), 
    floatingActionButton: FloatingActionButton(
                  tooltip: "Add Item",
                  backgroundColor:  Colors.black,
                    child : Icon(Icons.my_location),
                    onPressed: (){ Future<Map> temp = getDataPoint();}),
    );
  }
}