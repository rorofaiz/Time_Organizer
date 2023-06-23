import 'package:flutter/material.dart';
import 'package:timeorganize/Alarm.dart';
import 'package:timeorganize/SginUp.dart';
import 'package:timeorganize/SignIn.dart';
import 'package:timeorganize/UserInfo.dart';

import 'package:timeorganize/character.dart';

class MyDrawer extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  MyDrawer({Key? key}) : super(key: key);
  String text = 'Edit your own character';
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xffffffff),
      child: Material(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(-0.962, -0.283),
                    end: Alignment(1.0, 0.0),
                    colors: [
                      Color(0xffebebeb),
                      Color.fromRGBO(217, 235, 255, 1)
                    ],
                    stops: [0.0, 1.0],
                  ),
                ),
                accountName: const Text(
                  'Time Organizer',
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 28,
                    color: Color.fromARGB(255, 56, 56, 56),
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w700,
                    shadows: [
                      Shadow(
                        color: Color(0x29000000),
                        offset: Offset(0, 3),
                        blurRadius: 6,
                      )
                    ],
                  ),
                  textAlign: TextAlign.center,
                  softWrap: false,
                ),
                accountEmail: new Text('')),
            Container(
              padding: padding,
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'My Account',
                    icon: Icons.account_circle_outlined,
                    onClicked: () => selectedItem(context, 1),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Character settings',
                    icon: Icons.settings_accessibility_outlined,
                    onClicked: () => selectedItem(context, 2),
                  ),
                  const SizedBox(height: 24),
                  const Divider(color: Color.fromARGB(179, 129, 129, 129)),
                  const SizedBox(height: 24),
                  buildMenuItem(
                    text: 'Sign out',
                    icon: Icons.logout,
                    onClicked: () => selectedItem(context, 3),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Color.fromARGB(255, 56, 56, 56);

    final hoverColor = Color.fromARGB(255, 235, 235, 235);

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text,
          style: TextStyle(
            color: color,
            fontFamily: 'Segoe UI',
            fontSize: 15,
            fontWeight: FontWeight.w700,
          )),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const UserInfo(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => character(text: text),
        ));
        break;
      case 3:
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const SignIn()),
            (Route<dynamic> route) => false);
    }
  }
}
