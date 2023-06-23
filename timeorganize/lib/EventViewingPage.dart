import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeorganize/Add.dart';
import 'package:timeorganize/BottemAppbar.dart';
import 'package:timeorganize/Event.dart';
import 'package:timeorganize/EventProvider.dart';
import 'package:timeorganize/MyAppbar.dart';
import 'package:timeorganize/MyDrawer.dart';
import 'package:timeorganize/Taskpage.dart';
import 'package:timeorganize/Utils.dart';
import 'package:timeorganize/globel.dart';

class EventViewingPage extends StatefulWidget {
  Event event;
  EventViewingPage({required this.event, Key? key}) : super(key: key);

  @override
  _EventViewingPage createState() => _EventViewingPage();
}

class _EventViewingPage extends State<EventViewingPage>
    with SingleTickerProviderStateMixin {
  bool isOpened = false;
  double setwidth = 322;
  late AnimationController _animationController;
  late Animation<double> _animateIcon;
  late Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56;
  @override
  initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {});
          });
    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);

    _translateButton = Tween<double>(
      begin: _fabHeight,
      end: -14.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: _curve,
      ),
    ));
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  Widget delete() {
    return Container(
      child: FloatingActionButton(
        foregroundColor: Color.fromARGB(255, 255, 255, 255),
        backgroundColor: Color.fromARGB(255, 149, 148, 148),
        onPressed: () {
          final provider = Provider.of<EventProvider>(context, listen: false);
          provider.deleteEvent(widget.event);
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => taskpage(),
          ));
        },
        tooltip: 'delete',
        child: Icon(Icons.delete),
      ),
    );
  }

  Widget modifye() {
    return Container(
      child: FloatingActionButton(
        foregroundColor: Color.fromARGB(255, 255, 255, 255),
        backgroundColor: Color.fromARGB(255, 149, 148, 148),
        onPressed: () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => Add(event: widget.event),
          ),
        ),
        tooltip: 'modifye',
        child: Icon(Icons.edit),
      ),
    );
  }

  Widget menu() {
    return Container(
      child: FloatingActionButton(
        foregroundColor: Color.fromARGB(255, 255, 255, 255),
        backgroundColor: Color.fromARGB(255, 149, 148, 148),
        onPressed: animate,
        tooltip: 'menu',
        child: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: _animateIcon,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffbfbfb),
      appBar: MyAppbar(),
      drawer: MyDrawer(),
      bottomNavigationBar: BottemAppbar(2),
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox.expand(
                child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset(
                "images/add.gif",
              ),
            )),
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.close_rounded,
                  size: 30.0,
                )),
            Container(
              margin: const EdgeInsets.all(10),
              alignment: Alignment.bottomRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Transform(
                    transform: Matrix4.translationValues(
                      0.0,
                      _translateButton.value * 2.0,
                      0.0,
                    ),
                    child: delete(),
                  ),
                  Transform(
                    transform: Matrix4.translationValues(
                      0.0,
                      _translateButton.value,
                      0.0,
                    ),
                    child: modifye(),
                  ),
                  menu(),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 55, right: 30, left: 30),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Color.fromARGB(95, 235, 235, 235),
                borderRadius: BorderRadius.circular(30.0),
              ),
              height: setwidth,
              width: 550,
              child: Center(
                child: ListView(
                  // padding: const EdgeInsets.all(32),
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Event name',
                          style: TextStyle(
                            fontFamily: 'Rockwell Nova',
                            fontSize: 22,
                            color: Color.fromARGB(255, 29, 29, 29),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          color: widget.event.backgroundColor,
                          icon: Icon(
                            Icons.flag_outlined,
                            size: 30,
                            color: widget.event.backgroundColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.event.name,
                      style: const TextStyle(
                        fontFamily: 'Rockwell Nova',
                        fontSize: 18,
                        color: Color(0xff707070),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Description',
                      style: TextStyle(
                        fontFamily: 'Rockwell Nova',
                        fontSize: 22,
                        color: Color.fromARGB(255, 29, 29, 29),
                        fontWeight: FontWeight.w700,
                      ),
                      softWrap: false,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    buildDescription(widget.event),
                    const SizedBox(
                      height: 13,
                    ),
                    const Divider(
                      color: Color.fromARGB(255, 90, 90, 90),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    buildDateToDesplay(widget.event.from),
                    const SizedBox(
                      height: 3,
                    ),
                    const Divider(
                      color: Color.fromARGB(255, 90, 90, 90),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    buildDateTime(widget.event),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDateToDesplay(DateTime fromofEvent) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text(
          "Date",
          style: TextStyle(
            fontFamily: 'Rockwell Nova',
            fontSize: 15,
            color: Color.fromARGB(255, 29, 29, 29),
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          Utils.toDateformate(fromofEvent),
          style: const TextStyle(
            fontFamily: 'Rockwell Nova',
            fontSize: 13,
            color: Color(0xff707070),
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget buildDateTime(Event event) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildDate(event.isAllDay ? 'All-day' : 'From', event.from),
        if (!event.isAllDay)
          buildDate(event.isAllDay ? 'All-day' : 'To', event.to),
      ],
    );
  }

  Widget buildDate(String name, DateTime date) {
    return Column(
      children: [
        Text(
          name,
          style: const TextStyle(
            fontFamily: 'Rockwell Nova',
            fontSize: 22,
            color: Color.fromARGB(255, 29, 29, 29),
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          Utils.toTime(date),
          style: const TextStyle(
            fontFamily: 'Rockwell Nova',
            fontSize: 18,
            color: Color(0xff707070),
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget buildDescription(Event event) {
    if (event.description!.isEmpty) {
      return const Text(
        "None",
        style: TextStyle(
          fontFamily: 'Rockwell Nova',
          fontSize: 18,
          color: Color(0xff707070),
          fontWeight: FontWeight.w700,
        ),
      );
    } else {
      return Text(
        widget.event.description!,
        style: const TextStyle(
          fontFamily: 'Rockwell Nova',
          fontSize: 18,
          color: Color(0xff707070),
          fontWeight: FontWeight.w700,
        ),
      );
    }
  }
}
