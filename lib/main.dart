import 'package:flutter/material.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: { //this is to set up routing between the pages/screens
    '/':(context) => Loading(), //context is a function used to receive the page objects
    '/home':(context) => Home(),
    '/choose_location': (context) => ChooseLocation()
  }

));

