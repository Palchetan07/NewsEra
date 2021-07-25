import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Menuitem extends StatelessWidget {
  final IconData icon;
  final String title;



  const Menuitem({Key key, this.title, this.icon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.w300, fontSize: 15, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
