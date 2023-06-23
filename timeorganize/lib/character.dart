import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:timeorganize/Add.dart';
import 'package:timeorganize/globel.dart';
import 'manCharacter.dart';

class character extends StatefulWidget {
  String text;

  character({Key? key, required this.text}) : super(key: key);

  @override
  _character createState() => _character();
}

class _character extends State<character> {
  bool isActive = true;
  String errorChoose = "";
  String _erroe = "";
  int sellected = 2;
  final padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 20);
  late TextEditingController controller = TextEditingController();
  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      final isActive = controller.text.isNotEmpty;
      setState(() => this.isActive = isActive);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget customRadio(String im, int index) {
    return OutlineButton(
      onPressed: () {
        setState(() {
          sellected = index;
        });
      },
      child: Image.asset(im),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      borderSide: BorderSide(
        color: (sellected == index)
            ? Color.fromRGBO(218, 232, 241, 1)
            : Color(0xff1f1f1f),
        width: (sellected == index) ? 3 : 1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xfffbfbfb),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            ClipPath(
              clipper: BackgroundClipper(),
              child: Container(
                height: 200,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(-0.775, 0.0),
                    end: Alignment(0.881, 0.0),
                    colors: [
                      Color(0xffebebeb),
                      Color(0xffe0ecf5),
                      Color(0xffd7ecfe),
                    ],
                  ),
                ),
                child: Center(
                  child: Text(
                    widget.text,
                    style: const TextStyle(
                      fontFamily: 'Palatino Linotype',
                      fontSize: 20,
                      color: Color(0xff1f1f1f),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                    softWrap: false,
                  ),
                ),
              ),
            ),
            Pinned.fromPins(
              Pin(start: 300, end: 0),
              Pin(size: 60, start: 0),
              child: Container(
                child: IconButton(
                  icon: SvgPicture.asset(
                    'images/cross-circle.svg',
                    height: 35,
                    width: 35,
                  ),
                  onPressed: () {
                    Navigator.pop(
                      context,
                    );
                  },
                ),
              ),
            ),
            Pinned.fromPins(
              Pin(start: 35.0, end: 35.0),
              Pin(size: 102.0, start: 230),
              child: Stack(
                children: <Widget>[
                  Pinned.fromPins(
                    Pin(start: 3, end: 3),
                    Pin(size: 102.0, start: 270),
                    child: const Text(
                      'Enter a manager name',
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 15,
                        color: Color.fromARGB(255, 56, 56, 56),
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.left,
                      softWrap: false,
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(start: 0.0, end: 0.0),
                    Pin(size: 52.0, end: 0.0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      height: 55,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment(0.0, -1.0),
                          end: Alignment(0.0, 1.0),
                          colors: [Color(0xffebebeb), Color(0xffd7ecfe)],
                          stops: [0.0, 1.0],
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                        border: Border.all(
                            width: 1.0, color: const Color(0xff6b6464)),
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(start: 0.0, end: 0.0),
                    Pin(size: 70, end: -20),
                    child: Container(
                      // -----------------------------------------------------------------------TextFiled
                      child: TextField(
                        maxLength: 10,
                        controller: controller,
                        style: const TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 15,
                          color: Color(0xff6b6464),
                          fontWeight: FontWeight.w700,
                        ),
                        decoration: InputDecoration(
                          hintText: "nume",
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 180, 180, 180),
                          ),
                          errorText: _erroe,
                          errorStyle: TextStyle(
                            color: Color.fromARGB(255, 165, 83, 83),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(15),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Pinned.fromPins(
              Pin(start: 40, end: 40),
              Pin(size: 200, start: 360),
              child: Stack(
                children: <Widget>[
                  Align(
                    child: Container(
                      child: customRadio('images/man.png', 0),
                      width: 130.0,
                      height: 140.0,
                    ),
                    alignment: Alignment.bottomLeft,
                  ),
                  Align(
                    child: Container(
                      width: 130.0,
                      height: 140.0,
                      child: customRadio('images/woman.png', 1),
                    ),
                    alignment: Alignment.bottomRight,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      width: 190.0,
                      height: 27.0,
                      child: Text(
                        'Choose the gender',
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 15,
                          color: Color.fromARGB(255, 56, 56, 56),
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.left,
                        softWrap: false,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Pinned.fromPins(
              Pin(start: 47, end: 47),
              Pin(size: 20, start: 390),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      width: 190.0,
                      height: 170.0,
                      child: Text(
                        errorChoose,
                        style: TextStyle(
                          fontSize: 13,
                          color: Color.fromARGB(255, 165, 83, 83),
                        ),
                        softWrap: false,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Pinned.fromPins(
              Pin(start: 110, end: 110),
              Pin(size: 65, start: 590),
              child: Container(
                height: 60,
                width: 150,
                child: RaisedButton(
                  padding: EdgeInsets.all(-1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  onPressed: isActive
                      ? () {
                          setState(() {
                            if (controller.text.isEmpty &&
                                (sellected != 0 && sellected != 1)) {
                              _erroe = "Enter the Name";
                              errorChoose = ' please Choose ';
                            } else if (controller.text.isEmpty) {
                              _erroe = "Enter the Name";
                            } else if (sellected != 0 || sellected != 1) {
                              errorChoose = ' please Choose ';
                            } else if (controller.text.isNotEmpty &&
                                (sellected != 0 && sellected != 1)) {
                              _erroe = "";
                              errorChoose = '';
                            }
                          });
                          if (sellected == 0 && controller.text.isNotEmpty) {
                            setState(() {
                              globel.setName(controller.text);
                              //  print(globel.getName());
                            });
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => manCharacter()));
                            _erroe = "";
                            errorChoose = '';
                          } else if (sellected == 1) {
                            Fluttertoast.showToast(
                                timeInSecForIosWeb: 2,
                                msg:
                                    "Soon we will introduce you to the women's model",
                                backgroundColor:
                                    Color.fromARGB(255, 56, 56, 56),
                                fontSize: 18);
                            _erroe = "";
                            errorChoose = '';
                          }
                        }
                      : null,
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
                      child: Container(
                        constraints: const BoxConstraints(
                            maxHeight: 2000, maxWidth: 2000),
                        alignment: Alignment.center,
                        child: const Text(
                          'Set it up',
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
            ),
          ],
        ),
      ),
    );
  }
}

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height - 70);
    var controllPoint = Offset(50, size.height);
    var endpoint = Offset(size.height / 2, size.height);
    path.quadraticBezierTo(
        controllPoint.dx, controllPoint.dy, endpoint.dx, endpoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
