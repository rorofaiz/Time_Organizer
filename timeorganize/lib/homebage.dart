import 'dart:async';
import 'dart:convert';
import 'package:adobe_xd/pinned.dart';
import 'package:alan_voice/alan_voice.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:timeorganize/BottemAppbar.dart';
import 'package:timeorganize/ChatBot.dart';
import 'package:timeorganize/Event.dart';
import 'package:timeorganize/EventProvider.dart';
import 'package:timeorganize/SginUp.dart';
import 'package:timeorganize/MyAppbar.dart';
import 'package:timeorganize/MyCalendar.dart';
import 'package:timeorganize/MyDrawer.dart';
import 'package:intl/intl.dart';
import 'package:timeorganize/SignIn.dart';
import 'package:timeorganize/Taskpage.dart';
import 'package:timeorganize/UserInfo.dart';
import 'package:timeorganize/character.dart';
import 'package:timeorganize/globel.dart';

class homebage extends StatefulWidget {
  homebage({Key? key}) : super(key: key);

  @override
  _homebage createState() => _homebage();
}

DateTime timeBackPressed = DateTime.now();
late int sellecteddefult;
late int sellectedSkin;
late int sellectedEye;
late int sellectedHair;
late String name;
late String manager;
String eventName = '';
String description = '';
String fromdate = '';
String enddate = '';
String fromtime = '';
String endtime = '';
late DateTime datefrom;
late DateTime dateend;
late DateTime scheduleTime;
late DateTime scheduleDate;
late DateTime schedulefrom;
late DateTime scheduleto;
String text = '';
String namefile = "";
String stateimage = "";
int stateTime = 3;
String fullname = '';
late Timer _timer;
int c = 0;
late String? recurrenceRule = null;

class _homebage extends State<homebage> {
  _homebage() {
    AlanVoice.addButton(
      "c5c9d8ec847ebec956ec54d4f079215a2e956eca572e1d8b807a3e2338fdd0dc/stage",
      buttonAlign: AlanVoice.BUTTON_ALIGN_RIGHT,
      bottomMargin: 170,
      topMargin: 300,
    );
    AlanVoice.onCommand.add((command) => _handlrVommand(command.data));
  }
  @override
  void initState() {
    name = globel.getName();
    sellecteddefult = globel.getsellecteddefult();
    sellectedSkin = globel.getsellectedSkin();
    sellectedEye = globel.getsellectedEye();
    sellectedHair = globel.getsellectedHair();
    print(globel.getName());
    stateimage = "n";
    charcter();
    super.initState();
    Timer(
        Duration(seconds: 8),
        () => setState(() {
              _checkIsActive();
            }));
  }

  void _checkIsActive() async {
    var isActive = await AlanVoice.isActive();
    if (isActive) {
      print("yes isActive");
      returnafter();
    } else {
      print("no isActive");
      setState(() {
        stateimage = "w";
        charcter();
        Timer(
            Duration(seconds: 16),
            () => setState(() {
                  stateimage = "n";
                  charcter();
                }));
      });
    }
  }

  // handel
  void _handlrVommand(Map<String, dynamic> command) {
    switch (command["command"]) {
      case "talk":
        setState(() {
          stateTime = command["number"];
          stateimage = command["text"];
          charcter();
          _checkIsActive();
        });
        Timer(
            Duration(seconds: stateTime),
            () => setState(() {
                  stateimage = "n";
                  charcter();
                }));
        break;
      case "open-calendar":
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MyCalendar(),
        ));
        break;
      case "open-charactersetting":
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => character(text: "Edit your own character"),
        ));
        break;
      case "open-task":
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => taskpage(),
        ));
        break;
      case "open-chatbot":
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const ChatBot(),
        ));
        break;
      case "open-account":
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const UserInfo(),
        ));
        break;

      case "log out":
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const SignIn()),
            (Route<dynamic> route) => false);
        break;
      case "open-home":
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => homebage(),
        ));
        break;
      case "name-event":
        setState(() {
          eventName = command["text"];
        });
        break;
      case "description":
        setState(() {
          description = command["text"];
        });
        break;
      case "from-time":
        setState(() {
          fromtime = command["text"];
          String colect = fromdate + " " + fromtime;
          DateFormat d = DateFormat("yyyy-MM-dd HH:mm:ss");
          datefrom = d.parse(colect);
        });
        break;
      case "end-time":
        setState(() {
          endtime = command["text"];
          if (endtime == "") {
            DateFormat dateFormat = DateFormat("HH:mm:ss");
            DateTime f = dateFormat.parse(fromtime);
            DateTime e = f.add(const Duration(hours: 2));
            String newTime = dateFormat.format(e);
            endtime = newTime;
          }
          String colect = enddate + " " + endtime;
          DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
          dateend = dateFormat.parse(colect);
        });
        break;
      case "from-date":
        setState(() {
          fromdate = command["text"];
        });
        break;
      case "end-date":
        setState(() {
          enddate = command["text"];
          if (enddate == "") {
            enddate = fromdate;
          }
        });
        break;
      case "ADD":
        if (c == 0) {
          addTask();
          c++;
        }
        break;
      case "delete-event":
        setState(() {
          eventName = command["text"];
        });
        if (c == 0) {
          delete();
          c++;
        }

        break;
      case "AI-name":
        if (c == 0) {
          AlanVoice.playText(
              'I\'m  ' + name + ', your manager, What can I help you with?');
          c++;
        }

        break;
      case "AI-name1":
        if (c == 0) {
          AlanVoice.playText('My name is  ' + name + ', what\'s yours?');

          c++;
        }
        break;
      case "AI-name2":
        if (c == 0) {
          manager = command["text"];
          AlanVoice.playText('I\'m not ' +
              manager +
              ' You must be thinking of someone else. I am ' +
              name +
              ', your manager');

          c++;
        }
        break;
      case "REMINDER":
        setState(() {
          eventName = command["text"];
          description = "";
          enddate = command["date"];
          fromdate = command["date"];
          fromtime = command["fromtime"];
          endtime = command["endtime"];
          String colect = enddate + " " + endtime;
          DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
          dateend = dateFormat.parse(colect);
          String colect1 = fromdate + " " + fromtime;
          DateFormat dateFormat1 = DateFormat("yyyy-MM-dd HH:mm:ss");
          datefrom = dateFormat1.parse(colect1);
        });
        if (c == 0) {
          addTask();
          c++;
        }
        break;
      case "scheduleDateandtime":
        String colectdate = command["date"];
        String colecttime = command["time"];
        String colect = colectdate + " " + colecttime;
        DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
        scheduleDate = dateFormat.parse(colect);
        myschedule(scheduleDate);
        break;
      case "scheduleTime":
        String colectdate = command["date"];
        String colecttime = command["time"];
        String colect = colectdate + " " + colecttime;
        DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
        scheduleDate = dateFormat.parse(colect);
        myschedule(scheduleDate);
        break;
      case "scheduleDate":
        String colect = command["date"];
        DateFormat dateFormat = DateFormat("yyyy-MM-dd");
        scheduleDate = dateFormat.parse(colect);
        myschedule(scheduleDate);
        break;
      case "today":
        String colect = command["date"];
        print(colect);
        myschedule1(colect);
        break;
      case "tomorrow":
        String colect = command["date"];
        DateFormat dateFormat = DateFormat("yyyy-MM-dd");
        scheduleDate = dateFormat.parse(colect);
        myschedule(scheduleDate);
        break;
      case "yesterday":
        String colect = command["date"];
        DateFormat dateFormat = DateFormat("yyyy-MM-dd");
        scheduleDate = dateFormat.parse(colect);
        myschedule(scheduleDate);
        break;

      default:
    }
  }

//Widget
  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () async {
          final deifference = DateTime.now().difference(timeBackPressed);
          final isExit = deifference >= Duration(seconds: 2);
          timeBackPressed = DateTime.now();
          if (isExit) {
            const massage = "Press back again to exit";
            Fluttertoast.showToast(msg: massage, fontSize: 18);
            return false;
          } else {
            Fluttertoast.cancel();
            return true;
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: const Color(0xfffbfbfb),
          appBar: MyAppbar(),
          drawer: MyDrawer(),
          bottomNavigationBar: BottemAppbar(0),
          body: SafeArea(
            child: Stack(
              children: [
                Pinned.fromPins(
                  Pin(start: 20.0, end: 20.0),
                  Pin(size: 70.0, start: 20.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      width: 300.0,
                      height: 51.0,
                      child: Text(
                        name,
                        style: const TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 30,
                          color: Color.fromARGB(255, 56, 56, 56),
                          fontWeight: FontWeight.w700,
                        ),
                        softWrap: false,
                      ),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 15.0, end: 15.0),
                  Pin(size: 415.0, start: 75.0),
                  child: ClipOval(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(218, 232, 241, 1),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 126, 126, 126),
                            blurRadius: 15,
                            spreadRadius: 1,
                            offset: Offset(1, 0),
                          ),
                          BoxShadow(
                            color: Color.fromARGB(255, 255, 255, 255),
                            blurRadius: 15,
                            spreadRadius: 1,
                            offset: Offset(-4, -4),
                          ),
                        ],
                      ),
                      child: show(fullname),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget charcter() {
    if (sellecteddefult == 1 &&
        sellectedEye == -1 &&
        sellectedHair == -1 &&
        sellectedSkin == -1) {
      namefile = 'man(red,long,porcelan)';
      fullname = 'images/' + namefile + '/' + stateimage + '.gif';
      return show(fullname);
    } else if (sellecteddefult == 2 &&
        sellectedEye == -1 &&
        sellectedHair == -1 &&
        sellectedSkin == -1) {
      namefile = 'man(blue,short,white)';
      fullname = 'images/' + namefile + '/' + stateimage + '.gif';
      return show(fullname);
    } else if (sellectedEye == 1 && sellectedHair == 1 && sellectedSkin == 1) {
      namefile = 'man(red,long,white)';
      fullname = 'images/' + namefile + '/' + stateimage + '.gif';
      return show(fullname);
    } else if (sellectedEye == 1 && sellectedHair == 2 && sellectedSkin == 1) {
      namefile = 'man(red,short,white)';
      fullname = 'images/' + namefile + '/' + stateimage + '.gif';
      return show(fullname);
    } else if (sellectedEye == 1 && sellectedHair == 1 && sellectedSkin == 2) {
      namefile = 'man(red,long,porcelan)';
      fullname = 'images/' + namefile + '/' + stateimage + '.gif';
      return show(fullname);
    } else if (sellectedEye == 1 && sellectedHair == 2 && sellectedSkin == 2) {
      namefile = 'man(red,short,porcrlan)';
      fullname = 'images/' + namefile + '/' + stateimage + '.gif';
      return show(fullname);
    } else if (sellectedEye == 1 && sellectedHair == 1 && sellectedSkin == 3) {
      namefile = 'man(red,long,sienna)';
      fullname = 'images/' + namefile + '/' + stateimage + '.gif';
      return show(fullname);
    } else if (sellectedEye == 1 && sellectedHair == 2 && sellectedSkin == 3) {
      namefile = 'man(red,short,sienna)';
      fullname = 'images/' + namefile + '/' + stateimage + '.gif';
      return show(fullname);
    } else if (sellectedEye == 2 && sellectedHair == 1 && sellectedSkin == 1) {
      namefile = 'man(blue,long,white)';
      fullname = 'images/' + namefile + '/' + stateimage + '.gif';
      return show(fullname);
    } else if (sellectedEye == 2 && sellectedHair == 1 && sellectedSkin == 2) {
      namefile = 'man(blue,long,porcelan)';
      fullname = 'images/' + namefile + '/' + stateimage + '.gif';
      return show(fullname);
    } else if (sellectedEye == 2 && sellectedHair == 1 && sellectedSkin == 3) {
      namefile = 'man(blue,long,sienna)';
      fullname = 'images/' + namefile + '/' + stateimage + '.gif';
      return show(fullname);
    } else if (sellectedEye == 2 && sellectedHair == 2 && sellectedSkin == 1) {
      namefile = 'man(blue,short,white)';
      fullname = 'images/' + namefile + '/' + stateimage + '.gif';
      return show(fullname);
    } else if (sellectedEye == 2 && sellectedHair == 2 && sellectedSkin == 2) {
      namefile = 'man(blue,short,porcrlan)';
      fullname = 'images/' + namefile + '/' + stateimage + '.gif';
      return show(fullname);
    } else if (sellectedEye == 2 && sellectedHair == 2 && sellectedSkin == 2) {
      namefile = 'man(blue,short,sienna)';
      fullname = 'images/' + namefile + '/' + stateimage + '.gif';
      return show(fullname);
    }
    return show(fullname);
  }

  Widget show(String charater) {
    return Image.asset(
      (charater),
      fit: BoxFit.cover,
    );
  }

////////////////schedule speech

  ///////////add event speech
  void addTask() {
    final event = Event(
      name: eventName,
      description: description,
      from: datefrom,
      to: dateend,
      isAllDay: false,
      backgroundColor: const Color.fromARGB(255, 173, 178, 184),
      recurrenceRule: recurrenceRule,
    );
    final provider = Provider.of<EventProvider>(context, listen: false);
    provider.addEvent(event);
  }

  returnafter() {
    setState(() {
      Timer(
          Duration(
            microseconds: 15,
          ),
          () => setState(() {
                c = 0;
              }));
    });
  }

  void delete() {
    final provider = Provider.of<EventProvider>(context, listen: false);
    bool chek = provider.checkname(eventName);
    if (chek == true) {
      setState(() {
        stateimage = "ns";
        charcter();
      });
      AlanVoice.playText('the Event called ' +
          eventName +
          ' has been deleted. You can see it if you go to the calender page  ');
      Timer(
          Duration(seconds: 1),
          () => setState(() {
                stateimage = "n";
                charcter();
              }));
    } else if (chek == false) {
      AlanVoice.playText('Sorry, there is no event called  ' + eventName);
    }
  }

  void myschedule1(String scheduleDate) {
    final provider = Provider.of<EventProvider>(context, listen: false);
    List<String> eventchedule = provider.schedulenamelist(scheduleDate);
    List<String> timeschedule = provider.scheduletimelist(scheduleDate);
    for (int i = 0; i < eventchedule.length; i++) {
      print(eventchedule[i]);
      AlanVoice.playText('Sorry, gggggggggg ' + eventName);
    }
  }
}

void myschedule(DateTime scheduleDate) {}
void myschedulefrom(DateTime scheduleDate, DateTime scheduleto) {}
