import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeorganize/Event.dart';
import 'package:timeorganize/EventProvider.dart';
import 'dart:async';
import 'package:timeorganize/MyAppbar.dart';
import 'package:timeorganize/MyDrawer.dart';
import 'package:timeorganize/Taskpage.dart';
import 'package:timeorganize/Utils.dart';
import 'package:timeorganize/character.dart';
import 'package:timeorganize/globel.dart';

class Add extends StatefulWidget {
  final Event? event;
  const Add({Key? key, this.event}) : super(key: key);
  @override
  _AddState createState() => _AddState();
}

const MaterialColor buttonTextColor = MaterialColor(0xFFD7EAF6, <int, Color>{
  50: Color(0xFFD7EAF6),
  100: Color(0xFFD7EAF6),
  200: Color(0xFFD7EAF6),
  300: Color(0xFFD7EAF6),
  400: Color(0xFFD7EAF6),
  500: Color(0xFFD7EAF6),
  600: Color(0xFFD7EAF6),
  700: Color(0xFFD7EAF6),
  800: Color(0xFFD7EAF6),
  900: Color(0xFFD7EAF6),
});

class _AddState extends State<Add> {
  final _formkey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  late DateTime fromDate;
  late DateTime toDate;
  late Color eventColor;
  late Color eventColorflaf;
  late String? recurrenceRule = null;
  String? selectedValue;
  bool checkIsAllDay = false;

  @override
  void initState() {
    super.initState();
    if (widget.event == null) {
      eventColor = const Color.fromARGB(255, 173, 178, 184);
      eventColorflaf = const Color.fromARGB(255, 215, 215, 215);
      fromDate = DateTime.now();
      toDate = DateTime.now().add(const Duration(hours: 2));
    } else {
      final event = widget.event!;
      nameController.text = event.name;
      descriptionController.text = event.description!;
      fromDate = event.from;
      toDate = event.to;
      eventColor = event.backgroundColor;
      eventColorflaf = event.backgroundColor;
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromRGBO(251, 251, 251, 1),
        appBar: MyAppbar(),
        drawer: MyDrawer(),
        body: Stack(
          children: [
            SizedBox.expand(
                child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset(
                "images/add.gif",
              ),
            )),
            SingleChildScrollView(
              padding: const EdgeInsets.all(12),
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    frist(),
                    const SizedBox(
                      height: 30,
                    ),
                    headerName(),
                    buildName(),
                    const SizedBox(
                      height: 25,
                    ),
                    headerDescriptione(),
                    BuildDescription(),
                    const SizedBox(
                      height: 25,
                    ),
                    buildDateTimePickers(),
                    const SizedBox(
                      height: 12,
                    ),
                    const Divider(
                      color: Color(0xff707070),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    headerAlive(),
                    const SizedBox(
                      height: 12,
                    ),
                    const Divider(
                      color: Color(0xff707070),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    buildbuttom(),
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  Widget frist() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 70,
          height: 40.0,
          decoration: BoxDecoration(
            color: eventColorflaf,
            borderRadius: BorderRadius.circular(37.0),
            border: Border.all(
                width: 1.0, color: const Color.fromARGB(255, 231, 230, 230)),
            boxShadow: const [
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
          child: PopupMenuButton(
            tooltip: 'category',
            child: const Icon(
              Icons.flag_outlined,
              size: 35,
              color: Color(0xff1f1f1f),
            ),
            onSelected: (value) {
              switch (value) {
                case 1:
                  setState(() {
                    eventColor = const Color.fromARGB(255, 241, 62, 62);
                    eventColorflaf = const Color.fromARGB(255, 232, 154, 154);
                    globel.setcategory("Work");
                    globel.setcolorcategory(
                        const Color.fromARGB(255, 241, 62, 62));
                  });

                  break;
                case 2:
                  setState(() {
                    eventColor = const Color.fromRGBO(195, 224, 184, 1);
                    eventColorflaf = const Color.fromARGB(255, 202, 218, 197);
                    globel.setcolorcategory(
                        const Color.fromRGBO(195, 224, 184, 1));

                    globel.setcategory("Meeting");
                  });
                  break;
                case 3:
                  setState(() {
                    eventColor = const Color.fromRGBO(168, 222, 237, 1);
                    eventColorflaf = const Color.fromARGB(255, 187, 226, 237);
                    globel.setcategory("Personal");
                    globel.setcolorcategory(
                        const Color.fromRGBO(168, 222, 237, 1));
                  });
                  break;
                case 4:
                  setState(() {
                    eventColor = const Color.fromARGB(255, 173, 178, 184);
                    eventColorflaf = const Color.fromARGB(255, 215, 215, 215);
                    globel.setcolorcategory(
                        const Color.fromARGB(255, 173, 178, 184));
                    globel.setcategory("No catrgory");
                  });
                  break;
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Row(
                  children: const [
                    Icon(
                      Icons.flag_outlined,
                      color: Color.fromARGB(255, 241, 62, 62),
                      size: 22.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10.0,
                      ),
                      child: Text(
                        "Work",
                        style: TextStyle(
                          color: Color.fromARGB(255, 241, 62, 62),
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  ],
                ),
                value: 1,
              ),
              PopupMenuItem(
                child: Row(
                  children: const [
                    Icon(
                      Icons.flag_outlined,
                      color: Color.fromRGBO(195, 224, 184, 1),
                      size: 22.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10.0,
                      ),
                      child: Text(
                        "Meeting",
                        style: TextStyle(
                          color: Color.fromRGBO(195, 224, 184, 1),
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  ],
                ),
                value: 2,
              ),
              PopupMenuItem(
                child: Row(
                  children: const [
                    Icon(
                      Icons.flag_outlined,
                      color: Color.fromRGBO(168, 222, 237, 1),
                      size: 22.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10.0,
                      ),
                      child: Text(
                        "Personal",
                        style: TextStyle(
                          color: Color.fromRGBO(168, 222, 237, 1),
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ],
                ),
                value: 3,
              ),
              PopupMenuItem(
                child: Row(
                  children: const [
                    Icon(
                      Icons.flag_outlined,
                      color: Color.fromARGB(255, 173, 178, 184),
                      size: 22.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10.0,
                      ),
                      child: Text(
                        "No catrgory",
                        style: TextStyle(
                          color: Color.fromARGB(255, 173, 178, 184),
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ],
                ),
                value: 4,
              ),
            ],
          ),
        ),
        const Text(
          "EVENT",
          style: TextStyle(
            fontFamily: 'Segoe UI',
            fontSize: 25,
            color: Color(0xff1f1f1f),
            fontWeight: FontWeight.w700,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.keyboard_return,
            size: 30,
          ),
        ),
      ],
    );
  }

  Widget headerName() {
    return const Align(
      alignment: Alignment.bottomLeft,
      child: Text(
        'Event name',
        style: TextStyle(
          fontFamily: 'Segoe UI',
          fontSize: 22,
          color: Color.fromARGB(255, 46, 45, 45),
          fontWeight: FontWeight.w700,
        ),
        softWrap: false,
      ),
    );
  }

  Widget buildName() {
    return TextFormField(
      style: const TextStyle(
        fontFamily: 'Segoe UI',
        fontSize: 18,
        color: Color(0xff707070),
        fontWeight: FontWeight.w700,
      ),
      controller: nameController,
      onFieldSubmitted: (_) => saveForm(),
      validator: (name) => name != null && name.isEmpty || name!.length > 20
          ? "Event name is empty or more then 20 characters"
          : null,
    );
  }

  Widget headerDescriptione() {
    return const Align(
      alignment: Alignment.bottomLeft,
      child: Text(
        'Description',
        style: TextStyle(
          fontFamily: 'Segoe UI',
          fontSize: 22,
          color: Color.fromARGB(255, 46, 45, 45),
          fontWeight: FontWeight.w700,
        ),
        softWrap: false,
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget BuildDescription() {
    return TextFormField(
      style: const TextStyle(
        fontFamily: 'Segoe UI',
        fontSize: 18,
        color: Color(0xff707070),
        fontWeight: FontWeight.w700,
      ),
      controller: descriptionController,
    );
  }

  Widget headerAlive() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            'Add all day',
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 22,
              color: Color.fromARGB(255, 46, 45, 45),
              fontWeight: FontWeight.w700,
            ),
            softWrap: false,
          ),
        ),
        Align(
          child: Checkbox(
              value: checkIsAllDay,
              onChanged: (value) {
                setState(() {
                  checkIsAllDay = value!;
                });
              }),
        ),
      ],
    );
  }

  Widget buildDateTimePickers() {
    return Column(
      children: [
        headerFrom(),
        buildFrom(),
        const SizedBox(
          height: 15,
        ),
        headerTo(),
        BuildTo(),
      ],
    );
  }

  Widget headerFrom() {
    return const Align(
      alignment: Alignment.bottomLeft,
      child: Text(
        'From',
        style: TextStyle(
          fontFamily: 'Segoe UI',
          fontSize: 22,
          color: Color.fromARGB(255, 46, 45, 45),
          fontWeight: FontWeight.w700,
        ),
        softWrap: false,
      ),
    );
  }

  Widget buildFrom() {
    return Row(
      children: [
        Expanded(
          child: buildDropdownField(
            text: Utils.toDate(fromDate),
            onClicked: () => pickFromDateTime(pickDate: true),
          ),
        ),
        Expanded(
          child: buildDropdownField(
            text: Utils.toTime(fromDate),
            onClicked: () => pickFromDateTime(pickDate: false),
          ),
        ),
      ],
    );
  }

  Widget headerTo() {
    return const Align(
      alignment: Alignment.bottomLeft,
      child: Text(
        'To',
        style: TextStyle(
          fontFamily: 'Segoe UI',
          fontSize: 22,
          color: Color.fromARGB(255, 46, 45, 45),
          fontWeight: FontWeight.w700,
        ),
        softWrap: false,
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget BuildTo() {
    return Row(
      children: [
        Expanded(
          child: buildDropdownField(
            text: Utils.toDate(toDate),
            onClicked: () => pickToDateTime(pickDate: true),
          ),
        ),
        Expanded(
          child: buildDropdownField(
            text: Utils.toTime(toDate),
            onClicked: () => pickToDateTime(pickDate: false),
          ),
        ),
      ],
    );
  }

  Widget buildDropdownField({
    required String text,
    required VoidCallback onClicked,
  }) {
    return ListTile(
      title: Text(text),
      trailing: const Icon(Icons.arrow_drop_down),
      onTap: onClicked,
    );
  }

  Future pickFromDateTime({required bool pickDate}) async {
    final date = await pickDateTime(fromDate, pickDate: pickDate);
    if (date == null) return;

    if (date.isAfter(toDate)) {
      toDate =
          DateTime(date.year, date.month, date.day, toDate.hour, toDate.minute);
    }
    setState(() => fromDate = date);
    print(fromDate);
  }

  Future pickToDateTime({required bool pickDate}) async {
    final date = await pickDateTime(toDate,
        pickDate: pickDate, fristDate: pickDate ? fromDate : null);
    if (date == null) return;

    setState(() => toDate = date);
  }

  Future<DateTime?> pickDateTime(
    DateTime initialDate, {
    required bool pickDate,
    DateTime? fristDate,
  }) async {
    if (pickDate) {
      final date = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2024),
          builder: (context, child) {
            return Theme(
              data: ThemeData(
                primarySwatch: buttonTextColor,
              ),
              child: child!,
            );
          });
      if (date == null) return null;

      final time =
          Duration(hours: initialDate.hour, minutes: initialDate.minute);

      return date.add(time);
    } else {
      final timeOfDay = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.fromDateTime(initialDate),
          // initialEntryMode: TimePickerEntryMode.dial,
          builder: (context, child) {
            return Theme(
              data: ThemeData(
                primarySwatch: buttonTextColor,
              ),
              child: child!,
            );
          });
      if (timeOfDay == null) return null;
      final date =
          DateTime(initialDate.year, initialDate.month, initialDate.day);
      print(date);
      final time = Duration(hours: timeOfDay.hour, minutes: timeOfDay.minute);
      print(time);
      return date.add(time);
    }
  }

  Widget buildbuttom() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: SizedBox(
            height: 60,
            width: 150,
            // ignore: deprecated_member_use
            child: RaisedButton(
              padding: const EdgeInsets.all(-1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              onPressed: saveForm,
              child: Ink(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment(0.947, 0.0),
                    end: Alignment(-0.375, 0.488),
                    colors: [Color(0xffebebeb), Color(0xffd7ecfe)],
                    stops: [0.0, 1.0],
                  ),
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: Container(
                  constraints:
                      const BoxConstraints(maxHeight: 2000, maxWidth: 2000),
                  alignment: Alignment.center,
                  child: const Text(
                    'save',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 20,
                      color: Color.fromARGB(255, 56, 56, 56),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                    softWrap: false,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  saveForm() {
    final isValid = _formkey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      final event = Event(
        name: nameController.text,
        description: descriptionController.text,
        from: fromDate,
        to: toDate,
        isAllDay: checkIsAllDay,
        backgroundColor: eventColor,
        recurrenceRule: recurrenceRule,
      );
      final isEditing = widget.event != null;
      final provider = Provider.of<EventProvider>(context, listen: false);
      if (isEditing) {
        provider.modifyEvent(event, widget.event!);
        Navigator.of(context).pop();
      } else {
        provider.addEvent(event);
      }
    }
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => taskpage(),
    ));
  }
}
