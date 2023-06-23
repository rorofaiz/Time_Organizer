import 'dart:async';
import 'package:flutter/material.dart';
import 'package:timeorganize/Fb.dart';
import 'package:timeorganize/SginUp.dart';

class splash extends StatefulWidget {
  splash({Key? key}) : super(key: key);

  @override
  _splash createState() => _splash();
}

class _splash extends State<splash> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = const Duration(seconds: 5, microseconds: 30);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Fb()));
  }

  @override
  Widget build(BuildContext context) {
    return initWidget(context);
  }

  Widget initWidget(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                //  color: new Color(0xffF5591F),
                gradient: LinearGradient(colors: [
              (Color.fromARGB(255, 216, 238, 253)),
              Color.fromRGBO(235, 235, 235, 1)
            ], begin: Alignment(0, 0), end: Alignment.bottomCenter)),
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "images/splash.gif",
                  height: 120,
                ),
                const Text(
                  "Time Organizer",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 33,
                    color: Color.fromARGB(255, 56, 56, 56),
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w700,
                    shadows: [
                      Shadow(
                        color: Color(0x29000000),
                        offset: Offset(0, 7),
                        blurRadius: 6,
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
