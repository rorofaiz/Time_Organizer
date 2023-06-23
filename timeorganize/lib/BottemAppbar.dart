import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:timeorganize/ChatBot.dart';
import 'package:timeorganize/MyCalendar.dart';
import 'package:timeorganize/Taskpage.dart';
import 'package:timeorganize/homebage.dart';

class BottemAppbar extends StatefulWidget {
  int index;
  BottemAppbar(this.index, {Key? key}) : super(key: key);

  @override
  _BottemAppbar createState() => _BottemAppbar();
}

class _BottemAppbar extends State<BottemAppbar> {
  final PageStorageBucket buket = PageStorageBucket();
  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
        color: const Color.fromARGB(255, 47, 47, 47),
        activeColor: const Color.fromARGB(255, 47, 47, 47),
        gradient: const LinearGradient(
          begin: Alignment(-1.0, 0.0),
          end: Alignment(1.0, -0.134),
          colors: [Color(0xffebebeb), Color(0xffe4ebf2), Color(0xffd7ecfe)],
          stops: [0.0, 0.397, 1.0],
        ),
        backgroundColor: const Color(0xffebebeb),
        items: const [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.message, title: 'Chatbot'),
          TabItem(icon: Icons.task_outlined, title: 'Event'),
          TabItem(icon: Icons.calendar_month_rounded, title: 'Calendar'),
        ],
        initialActiveIndex: widget.index,
        onTap: (int i) {
          widget.index = i;
          selectedItem(context, i);
        });
  }

  void selectedItem(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => homebage(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ChatBot(),
        ));
        break;
      case 2:
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => taskpage()),
            (Route<dynamic> route) => false);
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MyCalendar(),
        ));
        break;
    }
  }
}
