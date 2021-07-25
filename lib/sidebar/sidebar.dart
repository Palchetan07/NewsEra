import 'dart:async';

import 'package:NewsEra/sidebar/menu_item.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sidebar extends StatefulWidget {
  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar>
    with SingleTickerProviderStateMixin<Sidebar> {
  AnimationController _animationController;
  StreamController<bool> isSidebarOpenedStreamcontroller;
  Stream<bool> isSidebarOpenedStream;
  StreamSink<bool> isSidebarOpenedSink;
  final _animationduration = const Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: _animationduration);
    isSidebarOpenedStreamcontroller = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarOpenedStreamcontroller.stream;
    isSidebarOpenedSink = isSidebarOpenedStreamcontroller.sink;
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSidebarOpenedStreamcontroller.close();
    isSidebarOpenedSink.close();
    super.dispose();
  }

  void ontapped() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;
    if (isAnimationCompleted) {
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return StreamBuilder<bool>(
        initialData: false,
        stream: isSidebarOpenedStream,
        builder: (context, isSidebarOpenedAsync) {
          return AnimatedPositioned(
            duration: _animationduration,
            top: 0,
            bottom: 0,
            left: isSidebarOpenedAsync.data ? 0 : -screenwidth,
            right: isSidebarOpenedAsync.data ? 0 : screenwidth - 45,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: Scaffold(
                      backgroundColor: Colors.black,
                      body: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 100,
                          ),
                          ListTile(
                            title: Text(
                              "Chetan Pal",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                            subtitle: Text(
                              "(Junior App Developer)",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 10,
                                  color: Colors.white),
                            ),
                            leading: CircleAvatar(
                              backgroundImage:
                                  AssetImage('Images/profile-pic.png'),
                              radius: 40.0,
                            ),
                          ),
                          Divider(
                            height: 64,
                            thickness: 0.5,
                            indent: 16,
                            endIndent: 16,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Menuitem(
                            title: "DashBoard",
                            icon: Icons.widgets_outlined,
                          ),
                          Menuitem(
                            title: "Favorites",
                            icon: Icons.favorite_border,
                          ),
                          Menuitem(
                            title: "My Account",
                            icon: Icons.account_circle,
                          ),
                          Menuitem(
                            title: "Setting",
                            icon: Icons.settings,
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Divider(
                            height: 64,
                            thickness: 0.5,
                            indent: 16,
                            endIndent: 16,
                            color: Colors.white,
                          ),
                          Menuitem(
                            title: "Feedback",
                            icon: Icons.feedback,
                          ),
                          Menuitem(
                            title: "Logout",
                            icon: Icons.exit_to_app,
                          ),
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.white,
                                ),
                                Icon(Icons.home, color: Colors.white),
                                Icon(Icons.shopping_basket,
                                    color: Colors.white),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0, -0.9),
                  child: GestureDetector(
                    onTap: () {
                      ontapped();
                    },
                    child: ClipPath(
                      clipper: CustomMenuClipper(),
                      child: Container(
                        width: 35,
                        height: 110,
                        color: Colors.black, //Color(0xFF40C4FF)
                        child: Center(
                          child: AnimatedIcon(
                              progress: _animationController.view,
                              icon: AnimatedIcons.menu_close,
                              color: Colors.white,
                              size: 25),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
