import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:timeorganize/BottemAppbar.dart';
import 'package:timeorganize/EventDataSoure.dart';
import 'package:timeorganize/EventProvider.dart';
import 'package:timeorganize/EventViewingPage.dart';
import 'package:timeorganize/MyAppbar.dart';
import 'package:timeorganize/MyDrawer.dart';

class MyCalendar extends StatelessWidget {
  MyCalendar({Key? key}) : super(key: key);
  DateTime timeBackPressed = DateTime.now();

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
          backgroundColor: const Color(0xfffbfbfb),
          appBar: MyAppbar(),
          drawer: MyDrawer(),
          bottomNavigationBar: BottemAppbar(3),
          body: SafeArea(
            child: Container(
              height: 600,
              child: SfCalendar(
                headerHeight: 80,
                allowedViews: const <CalendarView>[
                  CalendarView.week,
                  CalendarView.month,
                ],
                // allowViewNavigation: false,
                headerStyle: const CalendarHeaderStyle(
                  //textAlign: TextAlign.center,
                  textStyle: TextStyle(
                    fontFamily: 'Rockwell Nova',
                    fontSize: 20,
                    color: Color.fromARGB(255, 56, 56, 56),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                todayTextStyle: const TextStyle(color: Colors.white),
                view: CalendarView.month,
                viewHeaderStyle: const ViewHeaderStyle(
                  backgroundColor: Color.fromRGBO(218, 232, 241, 1),
                ),
                showDatePickerButton: true,
                monthViewSettings: const MonthViewSettings(
                  dayFormat: 'EEE',
                  agendaStyle: AgendaStyle(
                    appointmentTextStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 56, 56, 56),
                    ),
                    dayTextStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  showAgenda: true,
                  appointmentDisplayCount: 12,
                ),
                dataSource:
                    EventDataSoure(Provider.of<EventProvider>(context).events),
                initialDisplayDate: DateTime.now(),
                initialSelectedDate: DateTime.now(),
                cellBorderColor: Color.fromARGB(0, 146, 26, 26),
                onLongPress: (details) {
                  final provider =
                      Provider.of<EventProvider>(context, listen: false);
                  provider.setDate(details.date!);
                  provider.eventsOfSelecteDate;
                  if (details.appointments == null) {
                    return;
                  } else if (details.appointments != null) {
                    final event = details.appointments?.first;
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => EventViewingPage(event: event),
                    ));
                  }
                },
              ),
            ),
          ),
        ),
      );
}
