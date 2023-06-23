//this is class appbar

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  MyAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    return AppBar(
      leading: Builder(builder: (context) {
        return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(
              Icons.settings,
              color: Color.fromARGB(255, 56, 56, 56),
            ));
      }),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-1.0, 0.0),
            end: Alignment(1.0, -0.134),
            colors: [
              const Color(0xffebebeb),
              const Color(0xffe4ebf2),
              const Color(0xffd7ecfe)
            ],
            stops: [0.0, 0.397, 1.0],
          ),
        ),
      ),
      title: Text(
        DateFormat.yMMMMd().format(now),
        style: const TextStyle(
          fontFamily: 'Rockwell Nova',
          fontSize: 25,
          color: Color.fromARGB(255, 56, 56, 56),
          fontWeight: FontWeight.w700,
        ),
        softWrap: false,
      ),
      elevation: 8,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle.light,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
