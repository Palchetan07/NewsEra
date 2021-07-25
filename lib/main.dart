import 'package:NewsEra/screens/home.dart';
import 'package:NewsEra/sidebar/sidebarlayout.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter ',
      theme: ThemeData(
       primaryColor: Colors.white
      ),
      home: Home(),
    );
  }
}




