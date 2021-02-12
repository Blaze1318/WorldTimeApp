import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {}; // creating map object to hold data from load screen

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments; //storing data from previous route in map variable
    print(data);

    //getting time of day
    String daytimeImg = data['timeofDay'] ? 'day.png' : 'night.png';
    Color color = data['timeofDay'] ? Colors.blue : Colors.indigo[700];
    return Scaffold(
      backgroundColor: color,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$daytimeImg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
              child: Column(
                children: <Widget>[
                  FlatButton.icon(
                      onPressed: () async{
                        dynamic result =  await Navigator.pushNamed(context,'/choose_location');  //this places the location screen on top of the current one
                        setState(() {
                          data = {
                            'time':result['time'],
                            'location':result['location'],
                            'timeofDay' :result['timeofDay'],
                            'flag':result['flag'],
                          };
                        });
                  }, icon: Icon(
                      Icons.edit_location,
                    color: Colors.grey[300],
                  ),
                      label: Text(
                          'Edit Location',
                        style: TextStyle(
                          color: Colors.grey[300],
                        ),
                      )
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
                        color: Colors.white,
                      ),),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Text(data['time'],
                  style: TextStyle(
                    fontSize: 66.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),),
                ],
              ),
            ),
          )
    ),
    );
  }
}
