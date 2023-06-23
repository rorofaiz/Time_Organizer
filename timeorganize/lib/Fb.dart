import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:timeorganize/MainPage.dart';

class Fb extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyC2VAuRqpOGS82Iw7E0YRAhBQX7C0_WwR4',
          appId: '1:858045508211:android:64afdf412e9f02c3d89806',
          messagingSenderId: '858045508211',
          projectId: 'timeorganizer-c21f2'));
  Fb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _fbApp,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print('Something went wrong! ${snapshot.error.toString()}');
        } else if (snapshot.hasData) {
          return MainPage();
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
