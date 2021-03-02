
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:help_now_flutter_project/HomeScreen.dart';

class SplashScreen extends StatefulWidget
{
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
{
  TextEditingController phone = new TextEditingController();

  @override
  void initState() {
    super.initState();

    loadData();
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 5), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context)
  {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.green,
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(left: screenSize.width*0.05,right: screenSize.width*0.05),
            child: Center(
              child: Text(
                'HelpNow',
                style: TextStyle(
                  fontSize: 60.0,
                  color: Colors.white,
                  fontFamily: 'papyrus',
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(left: 14.0,right: 14.0,bottom: 30.0),
              child: LinearProgressIndicator(
                minHeight: 3.0,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          )
        ]
      ),
    );
  }
}

/*CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent),)*/