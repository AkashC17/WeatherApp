import 'package:flutter/material.dart';
import 'package:weather_app/Exception.dart';
import 'package:weather_app/choose_location.dart';
import 'package:weather_app/home_page.dart';
import 'package:weather_app/loading_screen.dart';


void main() {
  runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/' : (context) => Loading(),
        '/home' : (context) => HomePage(),
        '/location': (context) => Location(),
        '/exception': (context) => Exception()
      },

      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal),


  ));
}

