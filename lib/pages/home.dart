import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {}; // creating map object to hold data from load screen

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments; //storing data from previous route in map variable
    print(data);
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                    onPressed: () {
                  Navigator.pushNamed(context,'/choose_location');  //this places the location screen on top of the current one
                }, icon: Icon(Icons.edit_location),
                    label: Text('Edit Location')
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(data['location'],
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                    ),),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(data['time'],
                style: TextStyle(
                  fontSize: 66.0,
                  fontWeight: FontWeight.bold,
                ),),
              ],
            ),
          )
    ),
    );
  }
}
