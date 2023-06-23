import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:timeorganize/Event.dart';
import 'package:intl/intl.dart';

class EventProvider extends ChangeNotifier {
  final List<Event> _events = [
    //.............
  ];
  late bool check = false;
  List<String> eventschedule = [];
  List<String> timeschedule = [];
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  DateFormat dateFormat1 = DateFormat("hh:mm a");
  List<Event> get events => _events;
  List<Event> get listEvent => _events.where((element) => true).toList();
  DateTime _selecteDate = DateTime.now();
  DateTime get selecteDate {
    return _selecteDate;
  }

  void setDate(DateTime date) {
    _selecteDate = date;
  }

  List<Event> get eventsOfSelecteDate => _events;

  addEvent(Event event) {
    conflict(event);
    if (check == false ||
        event.backgroundColor == const Color.fromRGBO(168, 222, 237, 1)) {
      _events.add(event);
      notifyListeners();
      Fluttertoast.showToast(
        msg: "Event added successfully",
        backgroundColor: const Color.fromARGB(255, 56, 56, 56),
        fontSize: 18,
        timeInSecForIosWeb: 2,
      );

      // print("done");
    } else {
      // print("overlap");
      Fluttertoast.showToast(
        msg: "there is overlab",
        backgroundColor: const Color.fromARGB(255, 56, 56, 56),
        fontSize: 18,
        timeInSecForIosWeb: 2,
      );
    }
  }

  void deleteEvent(Event event) {
    _events.remove(event);
    notifyListeners();
    Fluttertoast.showToast(
      msg: "Event deleted successfully",
      backgroundColor: const Color.fromARGB(255, 56, 56, 56),
      fontSize: 18,
      timeInSecForIosWeb: 2,
    );
  }

  void modifyEvent(Event newEvent, Event oldEvent) {
    final index = _events.indexOf(oldEvent);
    conflict(newEvent);
    if (check == false) {
      _events[index] = newEvent;
      notifyListeners();
      Fluttertoast.showToast(
        msg: "Event edit successfully",
        backgroundColor: const Color.fromARGB(255, 56, 56, 56),
        fontSize: 18,
        timeInSecForIosWeb: 2,
      );
      // print("done");
    } else {
      // print("overlap");
      Fluttertoast.showToast(
        msg: "there is overlab",
        backgroundColor: const Color.fromARGB(255, 56, 56, 56),
        fontSize: 18,
        timeInSecForIosWeb: 2,
      );
    }
  }

  conflict(Event newEvent) {
    for (int i = 0; i < _events.length; i++) {
      if (newEvent.from.isBefore(_events[i].from) ||
          newEvent.from.isAfter(_events[i].from)) {
        check = false;
      } else if (newEvent.to.isBefore(_events[i].to) ||
          newEvent.to.isAfter(_events[i].to)) {
        check = false;
      } else {
        check = true;
      }
    }
  }

  Event returnEvent(int i) {
    Event event = Event(
        name: "",
        description: "",
        from: _selecteDate,
        to: _selecteDate,
        backgroundColor: const Color.fromARGB(255, 173, 178, 184),
        isAllDay: false);
    if (_events.isNotEmpty) {
      return _events[i];
    }
    return event;
  }

  int returnnumberofEvent() {
    if (_events.isNotEmpty) {
      int numberofEvent = 0;
      for (int i = 0; i < _events.length; i++) {
        numberofEvent++;
      }
      return numberofEvent;
    }
    return 0;
  }

  bool returnallday(int i) {
    bool check = false;
    if (_events.isNotEmpty) {
      check = _events[i].isAllDay;

      return check;
    }
    return check;
  }

  String returnnameEvent(int i) {
    String name;
    if (_events.isNotEmpty) {
      name = (_events[i].name);

      return name;
    }
    return "You have a free day";
  }

  String? returnDecEvent(int i) {
    String? description;
    if (_events.isNotEmpty) {
      description = (_events[i].description);

      return description;
    }
    return "None";
  }

  DateTime returnFromTimeEvent(int i) {
    DateTime from;
    if (_events.isNotEmpty) {
      from = _events[i].from;

      return from;
    }
    return DateTime.now();
  }

  DateTime returnToTimeEvent(int i) {
    DateTime to;
    if (_events.isNotEmpty) {
      to = _events[i].to;

      return to;
    }
    return DateTime.now();
  }

  Color returncolor(int i) {
    if (_events.isNotEmpty) {
      return _events[i].backgroundColor;
    }
    return const Color(0xFFADB2B8);
  }

  bool returnsamedate(int i) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    String s = dateFormat.format(_events[i].from);
    String s1 = dateFormat.format(DateTime.now());
    if (s == s1) {
      return true;
    }
    return false;
  }

  bool checkname(String name) {
    String checkname;
    for (int i = 0; i < _events.length; i++) {
      checkname = _events[i].name.toLowerCase();
      if (checkname == name.toLowerCase()) {
        deleteEvent(_events[i]);
        return true;
      }
    }
    return false;
  }

  List<String> schedulenamelist(String fromuser) {
    print(fromuser);
    for (int i = 0; i < _events.length; i++) {
      String s = dateFormat.format(_events[i].from);
      print(s);
      if (s == fromuser) {
        eventschedule[i] = _events[i].name;
      }
    }
    return eventschedule;
  }

  List<String> scheduletimelist(String fromuser) {
    for (int i = 0; i < _events.length; i++) {
      String s = dateFormat.format(_events[i].from);
      if (s == fromuser) {
        timeschedule[i] = dateFormat1.format(_events[i].from);
      }
    }
    return timeschedule;
  }
}
