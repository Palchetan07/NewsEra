import 'package:NewsEra/helper/data.dart';
import 'package:NewsEra/models/category_model.dart';
import 'package:NewsEra/screens/mainpage.dart';
import 'package:NewsEra/sidebar/sidebar.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        HomePage(),
        Sidebar()
      ],
    );
  }
}