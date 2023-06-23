import 'package:adobe_xd/pinned.dart';
import 'package:flutter/material.dart';

class Alarm extends StatefulWidget {
  const Alarm({Key? key}) : super(key: key);

  @override
  _AlarmState createState() => _AlarmState();
}

class _AlarmState extends State<Alarm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffbfbfb),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Align(
              alignment: const Alignment(0.0, -0.406),
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment(-0.857, 0.0),
                    end: Alignment(0.844, 0.0),
                    colors: [
                      Color(0xffebebeb),
                      Color(0xffebebeb),
                      Color(0xffd7ecfe)
                    ],
                    stops: [0.0, 0.236, 1.0],
                  ),
                  border:
                      Border.all(width: 1.0, color: const Color(0xff707070)),
                ),
              ),
            ),
            Pinned.fromPins(
              Pin(start: 0.0, end: 0.0),
              Pin(size: 69.0, start: 24.0),
              child: Stack(
                children: const <Widget>[
                  Align(
                    alignment: Alignment(-0.074, -0.25),
                    child: SizedBox(
                      width: 171.0,
                      height: 37.0,
                      child: Text(
                        'Notifications',
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 28,
                          color: Color(0xff1f1f1f),
                          fontWeight: FontWeight.w700,
                        ),
                        softWrap: false,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Pinned.fromPins(
              Pin(size: 321.0, start: 20.0),
              Pin(size: 48.0, start: 80.0),
              child: const Text(
                'Recurring reminders',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 25,
                  color: Color(0xff000000),
                ),
                softWrap: false,
              ),
            ),
            Pinned.fromPins(
              Pin(size: 321.0, start: 20.0),
              Pin(size: 100.0, start: 120.0),
              child: const Text(
                'Reminds every five minutes\nuntil confirmation',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 20,
                  color: Color(0xff707070),
                ),
                softWrap: false,
              ),
            ),
            Pinned.fromPins(
              Pin(size: 323.0, start: 20.0),
              Pin(size: 96.0, middle: 0.3157),
              child: const Text(
                'Notifications on app\nicons',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 25,
                  color: Color(0xff100f0f),
                ),
                softWrap: false,
              ),
            ),
            Pinned.fromPins(
              Pin(size: 219.0, start: 20.0),
              Pin(size: 48.0, middle: 0.4305),
              child: const Text(
                'Public notices',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 25,
                  color: Color(0xff100f0f),
                ),
                softWrap: false,
              ),
            ),
            Pinned.fromPins(
              Pin(size: 297.0, start: 20.0),
              Pin(size: 99.0, middle: 0.5151),
              child: const Text(
                'For privacy reasons, do not\ndisclose any information\nrelated to the mission',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 20,
                  color: Color(0xff707070),
                ),
                softWrap: false,
              ),
            ),
            Pinned.fromPins(
              Pin(size: 202.0, start: 20.0),
              Pin(size: 48.0, middle: 0.6207),
              child: const Text(
                'Alarm sound',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 25,
                  color: Color(0xff100f0f),
                ),
                softWrap: false,
              ),
            ),
            Pinned.fromPins(
              Pin(size: 66.0, start: 20.0),
              Pin(size: 33.0, middle: 0.6641),
              child: const Text(
                'Arrow',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 20,
                  color: Color(0xff707070),
                ),
                softWrap: false,
              ),
            ),
            Pinned.fromPins(
              Pin(size: 145.0, start: 20.0),
              Pin(size: 48.0, middle: 0.7358),
              child: const Text(
                'Vibration',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 25,
                  color: Color(0xff100f0f),
                ),
                softWrap: false,
              ),
            ),
            Pinned.fromPins(
              Pin(size: 189.0, middle: 0.5021),
              Pin(size: 68.0, end: 105.0),
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment(0.579, 0.0),
                        end: Alignment(-0.806, 0.0),
                        colors: [Color(0xffd7ecfe), Color(0xffebebeb)],
                        stops: [0.0, 1.0],
                      ),
                      borderRadius: BorderRadius.circular(35.0),
                      border: Border.all(
                          width: 1.0, color: const Color(0xff707070)),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 80.0, middle: 0.4954),
                    Pin(start: 10.0, end: 9.0),
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 37,
                        color: Color(0xff1f1f1f),
                        fontWeight: FontWeight.w700,
                      ),
                      softWrap: false,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
