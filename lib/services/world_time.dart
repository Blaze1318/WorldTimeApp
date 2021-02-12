import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime
{
  String location; //location name for ui
  String time; // time in the location
  String flag; //url assets flag icon
  String url; // url for the endpoints dealing with location
  bool timeofDay; //time of day base on the actual time am/pm

  WorldTime({this.location,this.flag,this.url,this.timeofDay});

  Future<void> getTime() async
  {
    try{
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map timeData = jsonDecode(response.body);
      //print(timeData);

      //get data from map object for time
      String datetime = timeData['datetime'];
      String offset = timeData['utc_offset'].substring(1,3);
      // print(datetime);
      //print(offset);

      //set time property
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      timeofDay =  now.hour > 6 && now.hour < 20;
      time =DateFormat.jm().format(now);
    }catch(e)
    {
      print('Caught Error $e');
      time = 'Could not load time data';
    }

  }
}