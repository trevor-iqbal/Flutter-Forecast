import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DataRepository extends StatefulWidget {
  @override
  _DataRepositoryState createState() => _DataRepositoryState();
}

class _DataRepositoryState extends State<DataRepository> {

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}
Future<Map> getDataPoint() async{
  String apiUrl ="https://api.darksky.net/forecast/97fffd1b9727d10dec8566dc63d34fc7/37.8267,-122.4233";
  http.Response response = await http.get(apiUrl);
  var data = json.decode(response.body);
  //  print(data["minutely"]["data"][0]["time"]);
  return data;
}