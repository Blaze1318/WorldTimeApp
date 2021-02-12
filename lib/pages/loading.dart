import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setWorldTime() async
  {
    WorldTime worldTime = WorldTime(location: 'Berlin',flag: 'germany.png',url: 'Europe/Berlin');
    await worldTime.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location':worldTime.location,
      'flag':worldTime.flag,
      'time':worldTime.time,
    });
  }

  @override
  void initState() {
    super.initState();
    setWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Center(
        child: SpinKitPulse(
          color: Colors.white,
          size: 50.0,
        )
      )
    );
  }
}
