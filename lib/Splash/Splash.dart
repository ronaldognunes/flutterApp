import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:super_lista/screns/Home/HomePage.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5)).then((_) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.indigo, Colors.cyanAccent],
              begin: Alignment.centerLeft,
              end: Alignment.bottomRight),
        ),
        child: Container(
          padding: EdgeInsets.only(left: 60),
          child: Center(
            child: FlareActor(
              'lib/assets/animscren.flr',
              animation: '1',
            ),
          ),
        ),
      ),
    );
  }
}
