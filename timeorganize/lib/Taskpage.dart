import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:timeorganize/Add.dart';
import 'package:timeorganize/BottemAppbar.dart';
import 'package:timeorganize/Event.dart';
import 'package:timeorganize/EventProvider.dart';
import 'package:timeorganize/EventViewingPage.dart';
import 'package:timeorganize/MyAppbar.dart';
import 'package:timeorganize/MyDrawer.dart';
import 'package:timeorganize/Utils.dart';
import 'package:fluttertoast/fluttertoast.dart';

class taskpage extends StatefulWidget {
  final Event? event;
  taskpage({Key? key, this.event}) : super(key: key);

  @override
  _taskpage createState() => _taskpage();
}

class _taskpage extends State<taskpage> {
  late int numberofEvent;
  late int count;
  double setwidth = 260;
  late bool returnsamedate;
  late Color eventColor;
  String s = "";
  late bool chackallday;
  late String nameofEvent;
  late String? DEsofEvent;
  late Event returnEvent;
  late DateTime fromofEvent;
  late DateTime toofEvent;
  List<Widget> _cardList = [];

  void _addCardWidget() {
    setState(() {
      _cardList.add(buildcontenar());
    });
  }

  DateTime timeBackPressed = DateTime.now();
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
          backgroundColor: Color(0xFFFBFBFB),
          appBar: MyAppbar(),
          drawer: MyDrawer(),
          bottomNavigationBar: BottemAppbar(2),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 5,
                ),
                buliderevent(),
                ListView.builder(
                  itemCount: _cardList.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (_, index) {
                    return GestureDetector(
                        child: _cardList[index],
                        onTap: () {
                          final provider = Provider.of<EventProvider>(context,
                              listen: false);
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => EventViewingPage(
                                event: provider.returnEvent(index)),
                          ));
                        });
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  "",
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 25,
                    color: Color.fromARGB(255, 56, 56, 56),
                    fontWeight: FontWeight.w700,
                  ),
                  softWrap: false,
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            heroTag: null,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const Add(),
              ));
            },
            backgroundColor: Color.fromRGBO(218, 232, 241, 1),
            foregroundColor: Color.fromARGB(255, 47, 47, 47),
            tooltip: 'Add new Event',
            child: const Icon(Icons.add),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniEndFloat,
        ),
      );

  Widget buliderevent() {
    final provider = Provider.of<EventProvider>(context, listen: false);
    numberofEvent = provider.returnnumberofEvent();
    if (numberofEvent != 0) {
      setState(() {
        for (int i = 0; i < numberofEvent; i++) {
          eventColor = provider.returncolor(i);
          nameofEvent = provider.returnnameEvent(i);
          DEsofEvent = provider.returnDecEvent(i);
          fromofEvent = provider.returnFromTimeEvent(i);
          toofEvent = provider.returnToTimeEvent(i);
          chackallday = provider.returnallday(i);
          returnEvent = provider.returnEvent(i);
          _addCardWidget();
        }
      });

      return const Align(
        alignment: Alignment.topLeft,
        child: Text(
          "Tasks",
          style: TextStyle(
            fontFamily: 'Segoe UI',
            fontSize: 25,
            color: Color.fromARGB(255, 56, 56, 56),
            fontWeight: FontWeight.w700,
          ),
          softWrap: false,
        ),
      );
    } else {
      return Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const SizedBox(
          height: 40,
        ),
        SvgPicture.asset(
          'images/free.svg',
          height: 280,
          width: 180,
        ),
        const SizedBox(
          height: 30,
        ),
        const Text(
          'You have a free day',
          style: TextStyle(
            fontFamily: 'Rockwell Nova',
            fontSize: 18,
            color: Color.fromARGB(255, 130, 130, 130),
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Relax and recharg',
          style: TextStyle(
            fontFamily: 'Rockwell Nova',
            fontSize: 14,
            color: Color.fromARGB(255, 130, 130, 130),
            fontWeight: FontWeight.w500,
          ),
        ),
      ]));
    }
  }

  Widget buildcontenar() {
    final provider = Provider.of<EventProvider>(context, listen: false);
    return Container(
      margin: const EdgeInsets.only(top: 10, right: 10, left: 10),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment(-1.0, 0.0),
          end: Alignment(1.0, -0.134),
          colors: [Color(0xffebebeb), Color(0xffe4ebf2), Color(0xffd7ecfe)],
          stops: [0.0, 0.397, 1.0],
        ),
        borderRadius: BorderRadius.circular(30.0),
      ),
      height: setwidth,
      width: 300,
      child: Column(
        // padding: const EdgeInsets.all(32),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.baseline,
            children: [
              const Text(
                'Event name',
                style: TextStyle(
                  fontFamily: 'Rockwell Nova',
                  fontSize: 15,
                  color: Color.fromARGB(255, 29, 29, 29),
                  fontWeight: FontWeight.w700,
                ),
              ),
              IconButton(
                onPressed: () {},
                color: eventColor,
                icon: Icon(
                  Icons.flag_outlined,
                  size: 30,
                  color: eventColor,
                ),
              ),
            ],
          ),
          Text(
            nameofEvent,
            style: const TextStyle(
              fontFamily: 'Rockwell Nova',
              fontSize: 13,
              color: Color(0xff707070),
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Description',
            style: TextStyle(
              fontFamily: 'Rockwell Nova',
              fontSize: 15,
              color: Color.fromARGB(255, 29, 29, 29),
              fontWeight: FontWeight.w700,
            ),
            softWrap: false,
          ),
          const SizedBox(
            height: 5,
          ),
          buildDescription(DEsofEvent),
          const SizedBox(
            height: 3,
          ),
          const Divider(
            color: Color.fromARGB(255, 90, 90, 90),
          ),
          const SizedBox(
            height: 3,
          ),
          buildDateToDesplay(fromofEvent),
          const SizedBox(
            height: 3,
          ),
          const Divider(
            color: Color.fromARGB(255, 90, 90, 90),
          ),
          const SizedBox(
            height: 3,
          ),
          buildDateTime(chackallday, fromofEvent, toofEvent),
        ],
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

  Widget buildDateTime(
      bool chackallday, DateTime fromofEvent, DateTime toofEvent) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildDate(chackallday ? 'All - day' : 'From', fromofEvent),
        if (!chackallday)
          buildDate(chackallday ? 'All - day' : 'To', toofEvent),
      ],
    );
  }

  buildDate(String name, DateTime date) {
    if ("All - day" != name) {
      return Column(
        children: [
          Text(
            name,
            style: const TextStyle(
              fontFamily: 'Rockwell Nova',
              fontSize: 15,
              color: Color.fromARGB(255, 29, 29, 29),
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            Utils.toTime(date),
            style: const TextStyle(
              fontFamily: 'Rockwell Nova',
              fontSize: 13,
              color: Color(0xff707070),
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      );
    } else {
      return Column(children: [
        const SizedBox(
          height: 5,
        ),
        Text(
          name,
          style: const TextStyle(
            fontFamily: 'Rockwell Nova',
            fontSize: 15,
            color: Color.fromARGB(255, 29, 29, 29),
            fontWeight: FontWeight.w700,
          ),
        ),
      ]);
    }
  }

  Widget buildDescription(String? event) {
    if (event!.isEmpty) {
      setState(() {
        setwidth = 257;
      });
      return const Text(
        "None",
        style: TextStyle(
          fontFamily: 'Rockwell Nova',
          fontSize: 13,
          color: Color(0xff707070),
          fontWeight: FontWeight.w700,
        ),
      );
    } else {
      setState(() {
        setwidth = 270;
      });
      return Text(
        event,
        style: const TextStyle(
          fontFamily: 'Rockwell Nova',
          fontSize: 13,
          color: Color(0xff707070),
          fontWeight: FontWeight.w700,
        ),
      );
    }
  }
}
