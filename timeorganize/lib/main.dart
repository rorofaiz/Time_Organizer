import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeorganize/EventProvider.dart';
import 'package:timeorganize/MyCalendar.dart';
import 'package:timeorganize/splash.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static String title = 'Time Organizer';

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => EventProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          theme: ThemeData(
            primarySwatch: Colors.grey,
          ),
          home: splash(),
        ),
      );
}
