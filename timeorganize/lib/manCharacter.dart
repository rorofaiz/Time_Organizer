import 'package:adobe_xd/adobe_xd.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:timeorganize/globel.dart';
import 'package:timeorganize/homebage.dart';

class manCharacter extends StatefulWidget {
  manCharacter({Key? key}) : super(key: key);

  @override
  _manCharacter createState() => _manCharacter();
}

late String name;
late int sellecteddefult = -1;
late int sellectedSkin = -1;
late int sellectedEye = -1;
late int sellectedHair = -1;

class _manCharacter extends State<manCharacter> {
  bool remmemberpwd = false;
  final padding = EdgeInsets.symmetric(horizontal: 20, vertical: 20);
  int sellected = 0;
  String iamgebulder = 'images/buildfoto/white-red-long.gif';
  int sellectedIamge = -1;
  String errorChoose = "";
  @override
  void initState() {
    name = globel.getName();

    // myObj.setName("John");
    print(globel.getName());

    super.initState();
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
                height: 420,
                color: Color.fromRGBO(218, 232, 241, 1),
                child: buildFooto(iamgebulder),
              ),
            ),
            Pinned.fromPins(
              Pin(start: 3, end: 3),
              Pin(size: 60, start: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
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
                  Text(
                    name,
                    style: const TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 25,
                      color: Color.fromARGB(255, 56, 56, 56),
                      fontWeight: FontWeight.w700,
                    ),
                    softWrap: false,
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.check_circle_outline,
                      size: 33.0,
                    ),
                    onPressed: () {
                      setState(() {
                        globel.setsellecteddefult(sellecteddefult);
                        globel.setsellectedEye(sellectedEye);
                        globel.setsellectedSkin(sellectedSkin);
                        globel.setsellectedHair(sellectedHair);
                      });
                      if (sellectedEye != -1 &&
                          sellectedHair != -1 &&
                          sellectedSkin != -1) {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => homebage(),
                        ));
                      } else if ((sellecteddefult == 1 ||
                              sellecteddefult == 2) &&
                          sellectedEye == -1 &&
                          sellectedHair == -1 &&
                          sellectedSkin == -1) {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => homebage(),
                        ));
                      } else if (sellectedEye == -1 ||
                          sellectedHair == -1 ||
                          sellectedSkin == -1 ||
                          sellecteddefult == -1) {
                        Fluttertoast.showToast(
                            gravity: ToastGravity.TOP,
                            msg: "Please select your manager's characteristics",
                            backgroundColor: Color.fromARGB(255, 56, 56, 56),
                            fontSize: 18);
                      }
                    },
                  ),
                ],
              ),
            ),
            Pinned.fromPins(
              Pin(start: 5, end: 5),
              Pin(size: 80, start: 430),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BuildDefult(0),
                  BuildSkin(1),
                  BuildEye(2),
                  BuildHair(3),
                ],
              ),
            ),
            Pinned.fromPins(
              Pin(start: 10, end: 10),
              Pin(size: 170, start: 510),
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment(-0.962, -0.283),
                    end: Alignment(1.0, 0.0),
                    colors: [Color(0xFFFBFBFB), Color(0xfffbfbfb)],
                    stops: [0.0, 1.0],
                  ),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      width: 1.2, color: Color.fromARGB(255, 179, 179, 179)),
                ),
                padding: padding,
                alignment: Alignment.topLeft,
                child: buildcharater(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildcharater() {
    if (sellected == 0) {
      return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        const SizedBox(
          width: 3,
        ),
        customImage('images/icon-man/defult-1.png', 0, -1),
        const SizedBox(
          width: 20,
        ),
        customImage('images/icon-man/defult-2.png', 1, -1),
        const SizedBox(
          width: 3,
        ),
      ]);
    } else if (sellected == 1) {
      return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        const SizedBox(
          width: 5,
        ),
        customImage('images/icon-man/white.png', 2, 1),
        const SizedBox(
          width: 10,
        ),
        customImage('images/icon-man/porcelan.png', 3, 2),
        const SizedBox(
          width: 10,
        ),
        customImage('images/icon-man/sienna.png', 4, 3),
        const SizedBox(
          width: 3,
        ),
      ]);
    } else if (sellected == 2) {
      return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        const SizedBox(
          width: 3,
        ),
        customImage('images/icon-man/red.png', 5, 4),
        const SizedBox(
          width: 20,
        ),
        customImage('images/icon-man/blue.png', 6, 5),
      ]);
    } else if (sellected == 3) {
      return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        const SizedBox(
          width: 3,
        ),
        customImage('images/icon-man/long.png', 7, 6),
        const SizedBox(
          width: 20,
        ),
        customImage('images/icon-man/short.png', 8, 7),
      ]);
    }
    return Icon(Icons.close);
  }

  Widget BuildDefult(int index) {
    return Column(children: [
      SizedBox(
        width: 85,
        height: 50,
        child: TextButton(
          child: const Text(
            'Model',
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 18,
              color: Color.fromARGB(255, 56, 56, 56),
              fontWeight: FontWeight.w700,
            ),
            softWrap: false,
          ),
          onPressed: () {
            setState(() {
              sellected = 0;
            });
          },
        ),
      ),
      Align(
          child: Column(
        children: <Widget>[
          if (sellected == 0) customRadio(sellected),
        ],
      )),
    ]);
  }

  Widget BuildSkin(int index) {
    return Column(children: [
      SizedBox(
        width: 85,
        height: 50,
        child: TextButton(
          child: const Text(
            'Skin',
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 18,
              color: Color.fromARGB(255, 56, 56, 56),
              fontWeight: FontWeight.w700,
            ),
            softWrap: false,
          ),
          onPressed: () {
            setState(() {
              sellected = 1;
            });
          },
        ),
      ),
      Align(
          child: Column(
        children: <Widget>[
          if (sellected == 1) customRadio(sellected),
        ],
      )),
    ]);
  }

  Widget BuildEye(int index) {
    return Column(children: [
      SizedBox(
        width: 85,
        height: 50,
        child: TextButton(
          child: const Text(
            'Eye',
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 18,
              color: Color.fromARGB(255, 56, 56, 56),
              fontWeight: FontWeight.w700,
            ),
            softWrap: false,
          ),
          onPressed: () {
            setState(() {
              sellected = 2;
            });
          },
        ),
      ),
      Align(
          child: Column(
        children: <Widget>[
          if (sellected == 2) customRadio(sellected),
        ],
      )),
    ]);
  }

  Widget BuildHair(int index) {
    return Column(children: [
      SizedBox(
        width: 85,
        height: 50,
        child: TextButton(
          child: const Text(
            'Hair',
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 19,
              color: Color.fromARGB(255, 56, 56, 56),
              fontWeight: FontWeight.w700,
            ),
            softWrap: false,
          ),
          onPressed: () {
            setState(() {
              sellected = 3;
            });
          },
        ),
      ),
      Align(
          child: Column(
        children: <Widget>[
          if (sellected == 3) customRadio(sellected),
        ],
      )),
    ]);
  }

  Widget customRadio(int index) {
    return Container(
        width: 85.0,
        height: 12.0,
        child: RaisedButton(
          onPressed: () {
            // setState(() {
            //  sellected = index;
            // });
          },
          color: const Color(0xff1f1f1f),
        ));
  }

  Widget buildFooto(String iamgebulder1) {
    return Image.asset(
      (iamgebulder1),
      fit: BoxFit.cover,
    );
  }

  Widget customImage(String im, int index, int control) {
    return OutlineButton(
      onPressed: () {
        setState(() {
          sellectedIamge = index;
          if (sellectedIamge == 0 && control == -1) {
            iamgebulder = 'images/buildfoto/white-red-long.gif';
            sellecteddefult = 1;
            sellectedEye = -1;
            sellectedHair = -1;
            sellectedSkin = -1;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          } else if (sellectedIamge == 1 && control == -1) {
            iamgebulder = 'images/buildfoto/white-blue-short.gif';
            sellecteddefult = 2;
            sellectedEye = -1;
            sellectedHair = -1;
            sellectedSkin = -1;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          }
          ////////////////////////////////////////////////////////just Skin
          else if (sellectedIamge == 2 &&
              control == 1 &&
              sellectedEye == -1 &&
              sellectedHair == -1) {
            iamgebulder = 'images/buildfoto/white.gif';
            sellectedSkin = 1;
            sellectedEye = -1;
            sellectedHair = -1;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          } else if (sellectedIamge == 3 &&
              control == 2 &&
              sellectedEye == -1 &&
              sellectedHair == -1) {
            iamgebulder = 'images/buildfoto/porcrlan.gif';
            sellectedSkin = 2;
            sellectedEye = -1;
            sellectedHair = -1;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          } else if (sellectedIamge == 4 &&
              control == 3 &&
              sellectedEye == -1 &&
              sellectedHair == -1) {
            iamgebulder = 'images/buildfoto/sienna.gif';
            sellectedSkin = 3;
            sellectedEye = -1;
            sellectedHair = -1;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          }
          /////////////////////////////////////////////////////skin and eye
          else if (sellectedIamge == 2 &&
              control == 1 &&
              sellectedEye == 1 &&
              sellectedHair == -1) {
            iamgebulder = 'images/buildfoto/white-red.gif';
            sellectedSkin = 1;
            sellectedEye = 1;
            sellectedHair = -1;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          } else if (sellectedIamge == 2 &&
              control == 1 &&
              sellectedEye == 2 &&
              sellectedHair == -1) {
            iamgebulder = 'images/buildfoto/white-blue.gif';
            sellectedSkin = 1;
            sellectedEye = 2;
            sellectedHair = -1;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          } else if (sellectedIamge == 3 &&
              control == 2 &&
              sellectedEye == 1 &&
              sellectedHair == -1) {
            iamgebulder = 'images/buildfoto/porcrlan-red.gif';
            sellectedSkin = 2;
            sellectedEye = 1;
            sellectedHair == -1;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          } else if (sellectedIamge == 3 &&
              control == 2 &&
              sellectedEye == 2 &&
              sellectedHair == -1) {
            iamgebulder = 'images/buildfoto/porcrlan-blue.gif';
            sellectedSkin = 2;
            sellectedEye = 2;
            sellectedHair == -1;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          } else if (sellectedIamge == 4 &&
              control == 3 &&
              sellectedEye == 1 &&
              sellectedHair == -1) {
            iamgebulder = 'images/buildfoto/sienna-red.gif';
            sellectedSkin = 3;
            sellectedEye = 1;
            sellectedHair == -1;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          } else if (sellectedIamge == 4 &&
              control == 3 &&
              sellectedEye == 2 &&
              sellectedHair == -1) {
            iamgebulder = 'images/buildfoto/sienna-blue.gif';
            sellectedSkin = 3;
            sellectedEye = 2;
            sellectedHair == -1;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          }
          /////////////////////////////////////////////////////white skin eye and hair
          else if (sellectedIamge == 2 &&
              control == 1 &&
              sellectedEye == 1 &&
              sellectedHair == 1) {
            iamgebulder = 'images/buildfoto/white-red-long.gif';
            sellectedSkin = 1;
            sellectedEye = 1;
            sellectedHair = 1;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          } else if (sellectedIamge == 2 &&
              control == 1 &&
              sellectedEye == 1 &&
              sellectedHair == 2) {
            iamgebulder = 'images/buildfoto/white-red-short.gif';
            sellectedSkin = 1;
            sellectedEye = 1;
            sellectedHair = 2;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          }
          ////////////////////////////////////////////////////whait skin eye and hair

          else if (sellectedIamge == 2 &&
              control == 1 &&
              sellectedEye == 2 &&
              sellectedHair == 1) {
            iamgebulder = 'images/buildfoto/white-blue-long.gif';
            sellectedSkin = 1;
            sellectedEye = 2;
            sellectedHair = 1;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          } else if (sellectedIamge == 2 &&
              control == 1 &&
              sellectedEye == 2 &&
              sellectedHair == 2) {
            iamgebulder = 'images/buildfoto/white-blue-short.gif';
            sellectedSkin = 1;
            sellectedEye = 2;
            sellectedHair = 2;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          }
          ////////////////////////////////////////////////////porcrlan skin eye and hair
          else if (sellectedIamge == 3 &&
              control == 2 &&
              sellectedEye == 1 &&
              sellectedHair == 1) {
            iamgebulder = 'images/buildfoto/porcrlan-red-long.gif';
            sellectedSkin = 2;
            sellectedEye = 1;
            sellectedHair = 1;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          } else if (sellectedIamge == 3 &&
              control == 2 &&
              sellectedEye == 1 &&
              sellectedHair == 2) {
            iamgebulder = 'images/buildfoto/porcrlan-red-short.gif';
            sellectedSkin = 2;
            sellectedEye = 1;
            sellectedHair = 2;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          }
          ///////////////////////////////////////////////////////////porcrlan skin eye and hair
          else if (sellectedIamge == 3 &&
              control == 2 &&
              sellectedEye == 2 &&
              sellectedHair == 1) {
            iamgebulder = 'images/buildfoto/porcrlan-blue-long.gif';
            sellectedSkin = 2;
            sellectedEye = 2;
            sellectedHair = 1;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          } else if (sellectedIamge == 3 &&
              control == 2 &&
              sellectedEye == 2 &&
              sellectedHair == 2) {
            iamgebulder = 'images/buildfoto/porcrlan-blue-short.gif';
            sellectedSkin = 2;
            sellectedEye = 2;
            sellectedHair = 2;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          }
          ///////////////////////////////////////////////////////////sienna skin eye and hair
          else if (sellectedIamge == 4 &&
              control == 3 &&
              sellectedEye == 1 &&
              sellectedHair == 1) {
            iamgebulder = 'images/buildfoto/sienna-red-long.gif';
            sellectedSkin = 3;
            sellectedEye = 1;
            sellectedHair = 1;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          } else if (sellectedIamge == 4 &&
              control == 3 &&
              sellectedEye == 1 &&
              sellectedHair == 2) {
            iamgebulder = 'images/buildfoto/sienna-red-short.gif';
            sellectedSkin = 3;
            sellectedEye = 1;
            sellectedHair = 2;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          }
          //////////////////////////////////////////////////////////sienna skin eye and hair
          else if (sellectedIamge == 4 &&
              control == 3 &&
              sellectedEye == 2 &&
              sellectedHair == 1) {
            iamgebulder = 'images/buildfoto/sienna-blue-long.gif';
            sellectedSkin = 3;
            sellectedEye = 2;
            sellectedHair = 1;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          } else if (sellectedIamge == 4 &&
              control == 3 &&
              sellectedEye == 2 &&
              sellectedHair == 2) {
            iamgebulder = 'images/buildfoto/sienna-blue-short.gif';
            sellectedSkin = 3;
            sellectedEye = 2;
            sellectedHair = 2;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          }
          //////////////////////////////////////////////////////////red eye
          else if (sellectedIamge == 5 &&
              control == 4 &&
              sellectedHair == -1 &&
              sellectedSkin == -1) {
            iamgebulder = 'images/buildfoto/white-red.gif';
            sellectedEye = 1;
            sellectedSkin = -1;
            sellectedHair = -1;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          } //////////////////////
          else if (sellectedIamge == 5 &&
              control == 4 &&
              sellectedHair == -1 &&
              sellectedSkin == 1) {
            iamgebulder = 'images/buildfoto/white-red.gif';
            sellectedEye = 1;
            sellectedSkin = 1;
            sellectedHair = -1;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          } else if (sellectedIamge == 5 &&
              control == 4 &&
              sellectedHair == -1 &&
              sellectedSkin == 2) {
            iamgebulder = 'images/buildfoto/porcrlan-red.gif';
            sellectedEye = 1;
            sellectedSkin = 2;
            sellectedHair = -1;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          } else if (sellectedIamge == 5 &&
              control == 4 &&
              sellectedHair == -1 &&
              sellectedSkin == 3) {
            iamgebulder = 'images/buildfoto/sienna-red.gif';
            sellectedEye = 1;
            sellectedSkin = 3;
            sellectedHair = -1;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          } ///////////////////////
          else if (sellectedIamge == 5 &&
              control == 4 &&
              sellectedHair == 1 &&
              sellectedSkin == -1) {
            iamgebulder = 'images/buildfoto/white-red-long.gif';
            sellectedEye = 1;
            sellectedSkin = -1;
            sellectedHair = 1;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          } else if (sellectedIamge == 5 &&
              control == 4 &&
              sellectedHair == 2 &&
              sellectedSkin == -1) {
            iamgebulder = 'images/buildfoto/white-red-short.gif';
            sellectedEye = 1;
            sellectedSkin = -1;
            sellectedHair = 2;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          } else if (sellectedIamge == 5 &&
              control == 4 &&
              sellectedHair == 2 &&
              sellectedSkin == -1) {
            iamgebulder = 'images/buildfoto/white-red-short.gif';
            sellectedEye = 1;
            sellectedSkin = -1;
            sellectedHair = 2;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          } ////////////////////////////
          else if (sellectedIamge == 5 &&
              control == 4 &&
              sellectedHair == 1 &&
              sellectedSkin == 1) {
            iamgebulder = 'images/buildfoto/white-red-long.gif';
            sellectedEye = 1;
            sellectedSkin = 1;
            sellectedHair = 1;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          } else if (sellectedIamge == 5 &&
              control == 4 &&
              sellectedHair == 1 &&
              sellectedSkin == 2) {
            iamgebulder = 'images/buildfoto/porcrlan-red-long.gif';
            sellectedEye = 1;
            sellectedSkin = 2;
            sellectedHair = 1;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          } else if (sellectedIamge == 5 &&
              control == 4 &&
              sellectedHair == 1 &&
              sellectedSkin == 3) {
            iamgebulder = 'images/buildfoto/sienna-red-long.gif';
            sellectedEye = 1;
            sellectedSkin = 3;
            sellectedHair = 1;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          } else if (sellectedIamge == 5 &&
              control == 4 &&
              sellectedHair == 2 &&
              sellectedSkin == 1) {
            iamgebulder = 'images/buildfoto/white-red-short.gif';
            sellectedEye = 1;
            sellectedSkin = 1;
            sellectedHair = 2;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          } else if (sellectedIamge == 5 &&
              control == 4 &&
              sellectedHair == 2 &&
              sellectedSkin == 2) {
            iamgebulder = 'images/buildfoto/porcrlan-red-short.gif';
            sellectedEye = 1;
            sellectedSkin = 2;
            sellectedHair = 2;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          } else if (sellectedIamge == 5 &&
              control == 4 &&
              sellectedHair == 2 &&
              sellectedSkin == 3) {
            iamgebulder = 'images/buildfoto/sienna-red-short.gif';
            sellectedEye = 1;
            sellectedSkin = 3;
            sellectedHair = 2;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          }

          //////////////////////////////////////////////////////blue eye
          else if (sellectedIamge == 6 &&
              control == 5 &&
              sellectedHair == -1 &&
              sellectedSkin == -1) {
            iamgebulder = 'images/buildfoto/white-blue.gif';
            sellectedEye = 2;
            sellectedSkin = -1;
            sellectedHair = -1;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          } /////////////////////
          else if (sellectedIamge == 6 &&
              control == 5 &&
              sellectedHair == -1 &&
              sellectedSkin == 1) {
            iamgebulder = 'images/buildfoto/white-blue.gif';
            sellectedEye = 2;
            sellectedSkin = 1;
            sellectedHair = -1;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          } else if (sellectedIamge == 6 &&
              control == 5 &&
              sellectedHair == -1 &&
              sellectedSkin == 2) {
            iamgebulder = 'images/buildfoto/porcrlan-blue.gif';
            sellectedEye = 2;
            sellectedSkin = 2;
            sellectedHair = -1;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          } else if (sellectedIamge == 6 &&
              control == 5 &&
              sellectedHair == -1 &&
              sellectedSkin == 3) {
            iamgebulder = 'images/buildfoto/sienna-blue.gif';
            sellectedEye = 2;
            sellectedSkin = 3;
            sellectedHair = -1;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          } ////////////////////////
          else if (sellectedIamge == 6 &&
              control == 5 &&
              sellectedHair == 1 &&
              sellectedSkin == -1) {
            iamgebulder = 'images/buildfoto/white-blue-long.gif';
            sellectedEye = 2;
            sellectedSkin = -1;
            sellectedHair = 1;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          } else if (sellectedIamge == 6 &&
              control == 5 &&
              sellectedHair == 2 &&
              sellectedSkin == -1) {
            iamgebulder = 'images/buildfoto/white-blue-short.gif';
            sellectedEye = 2;
            sellectedSkin = -1;
            sellectedHair = 2;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          } //////////////////////////
          else if (sellectedIamge == 6 &&
              control == 5 &&
              sellectedHair == 1 &&
              sellectedSkin == 1) {
            iamgebulder = 'images/buildfoto/white-blue-long.gif';
            sellectedEye = 2;
            sellectedSkin = 1;
            sellectedHair = 1;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          } else if (sellectedIamge == 6 &&
              control == 5 &&
              sellectedHair == 1 &&
              sellectedSkin == 2) {
            iamgebulder = 'images/buildfoto/porcrlan-blue-long.gif';
            sellectedEye = 2;
            sellectedSkin = 2;
            sellectedHair = 1;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          } else if (sellectedIamge == 6 &&
              control == 5 &&
              sellectedHair == 1 &&
              sellectedSkin == 3) {
            iamgebulder = 'images/buildfoto/sienna-blue-long.gif';
            sellectedEye = 2;
            sellectedSkin = 3;
            sellectedHair = 1;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          } else if (sellectedIamge == 6 &&
              control == 5 &&
              sellectedHair == 2 &&
              sellectedSkin == 1) {
            iamgebulder = 'images/buildfoto/white-blue-short.gif';
            sellectedEye = 2;
            sellectedSkin = 1;
            sellectedHair = 2;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          } else if (sellectedIamge == 6 &&
              control == 5 &&
              sellectedHair == 2 &&
              sellectedSkin == 2) {
            iamgebulder = 'images/buildfoto/porcrlan-blue-short.gif';
            sellectedEye = 2;
            sellectedSkin = 2;
            sellectedHair = 2;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          } else if (sellectedIamge == 6 &&
              control == 5 &&
              sellectedHair == 2 &&
              sellectedSkin == 3) {
            iamgebulder = 'images/buildfoto/sienna-blue-short.gif';
            sellectedEye = 2;
            sellectedSkin = 3;
            sellectedHair = 2;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          }
          ///////////////////////////////////////////////////////long hair
          else if (sellectedIamge == 7 &&
              control == 6 &&
              sellectedEye == -1 &&
              sellectedSkin == -1) {
            iamgebulder = 'images/buildfoto/long.gif';
            sellectedHair = 1;
            sellectedEye = -1;
            sellectedSkin = -1;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          } /////////////////////////////////////
          else if (sellectedIamge == 7 &&
              control == 6 &&
              sellectedEye == 1 &&
              sellectedSkin == -1) {
            iamgebulder = 'images/buildfoto/white-red-long.gif';
            sellectedHair = 1;
            sellectedEye = 1;
            sellectedSkin = -1;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          } else if (sellectedIamge == 7 &&
              control == 6 &&
              sellectedEye == 2 &&
              sellectedSkin == -1) {
            iamgebulder = 'images/buildfoto/white-blue-long.gif';
            sellectedHair = 1;
            sellectedEye = 2;
            sellectedSkin = -1;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          } /////////////////////////////////////////
          else if (sellectedIamge == 7 &&
              control == 6 &&
              sellectedEye == -1 &&
              sellectedSkin == 1) {
            iamgebulder = 'images/buildfoto/long.gif';
            sellectedHair = 1;
            sellectedEye = -1;
            sellectedSkin = 1;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          } else if (sellectedIamge == 7 &&
              control == 6 &&
              sellectedEye == -1 &&
              sellectedSkin == 2) {
            iamgebulder = 'images/buildfoto/porcrlan-long.gif';
            sellectedHair = 1;
            sellectedEye = -1;
            sellectedSkin = 2;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          } else if (sellectedIamge == 7 &&
              control == 6 &&
              sellectedEye == -1 &&
              sellectedSkin == 3) {
            iamgebulder = 'images/buildfoto/sienna-long.gif';
            sellectedHair = 1;
            sellectedEye = -1;
            sellectedSkin = 3;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          }
          ////////////////////////////////////
          else if (sellectedIamge == 7 &&
              control == 6 &&
              sellectedEye == 1 &&
              sellectedSkin == 1) {
            iamgebulder = 'images/buildfoto/white-red-long.gif';
            sellectedHair = 1;
            sellectedEye = 1;
            sellectedSkin = 1;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          } else if (sellectedIamge == 7 &&
              control == 6 &&
              sellectedEye == 1 &&
              sellectedSkin == 2) {
            iamgebulder = 'images/buildfoto/porcrlan-red-long.gif';
            sellectedHair = 1;
            sellectedEye = 1;
            sellectedSkin = 2;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          } else if (sellectedIamge == 7 &&
              control == 6 &&
              sellectedEye == 1 &&
              sellectedSkin == 3) {
            iamgebulder = 'images/buildfoto/sienna-red-long.gif';
            sellectedHair = 1;
            sellectedEye = 1;
            sellectedSkin = 3;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          } else if (sellectedIamge == 7 &&
              control == 6 &&
              sellectedEye == 2 &&
              sellectedSkin == 1) {
            iamgebulder = 'images/buildfoto/white-blue-long.gif';
            sellectedHair = 1;
            sellectedEye = 2;
            sellectedSkin = 1;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          } else if (sellectedIamge == 7 &&
              control == 6 &&
              sellectedEye == 2 &&
              sellectedSkin == 2) {
            iamgebulder = 'images/buildfoto/porcrlan-blue-long.gif';
            sellectedHair = 1;
            sellectedEye = 2;
            sellectedSkin = 2;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          } else if (sellectedIamge == 7 &&
              control == 6 &&
              sellectedEye == 2 &&
              sellectedSkin == 3) {
            iamgebulder = 'images/buildfoto/sienna-blue-long.gif';
            sellectedHair = 1;
            sellectedEye = 2;
            sellectedSkin = 3;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          }
          //////////////////////////////////////////////short haie
          else if (sellectedIamge == 8 &&
              control == 7 &&
              sellectedEye == -1 &&
              sellectedSkin == -1) {
            iamgebulder = 'images/buildfoto/short.gif';
            sellectedHair = 2;
            sellectedEye = -1;
            sellectedSkin = -1;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          }
          /////////////////////////
          else if (sellectedIamge == 8 &&
              control == 7 &&
              sellectedEye == 1 &&
              sellectedSkin == -1) {
            iamgebulder = 'images/buildfoto/white-red-short.gif';
            sellectedHair = 2;
            sellectedEye = 1;
            sellectedSkin = -1;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          } else if (sellectedIamge == 8 &&
              control == 7 &&
              sellectedEye == 2 &&
              sellectedSkin == -1) {
            iamgebulder = 'images/buildfoto/white-blue-short.gif';
            sellectedHair = 2;
            sellectedEye = 2;
            sellectedSkin = -1;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
            ////////////////////////////////
          } else if (sellectedIamge == 8 &&
              control == 7 &&
              sellectedEye == -1 &&
              sellectedSkin == 1) {
            iamgebulder = 'images/buildfoto/short.gif';
            sellectedHair = 2;
            sellectedEye = -1;
            sellectedSkin = 1;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          } else if (sellectedIamge == 8 &&
              control == 7 &&
              sellectedEye == -1 &&
              sellectedSkin == 2) {
            iamgebulder = 'images/buildfoto/porcrlan-short.gif';
            sellectedHair = 2;
            sellectedEye = -1;
            sellectedSkin = 2;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          } else if (sellectedIamge == 8 &&
              control == 7 &&
              sellectedEye == -1 &&
              sellectedSkin == 3) {
            iamgebulder = 'images/buildfoto/sienna-short.gif';
            sellectedHair = 2;
            sellectedEye = -1;
            sellectedSkin = 3;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          }
          //////////////////////////////////////
          else if (sellectedIamge == 8 &&
              control == 7 &&
              sellectedEye == 1 &&
              sellectedSkin == 1) {
            iamgebulder = 'images/buildfoto/white-red-short.gif';
            sellectedHair = 2;
            sellectedEye = 1;
            sellectedSkin = 1;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          } else if (sellectedIamge == 8 &&
              control == 7 &&
              sellectedEye == 1 &&
              sellectedSkin == 2) {
            iamgebulder = 'images/buildfoto/porcrlan-red-short.gif';
            sellectedHair = 2;
            sellectedEye = 1;
            sellectedSkin = 2;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          } else if (sellectedIamge == 8 &&
              control == 7 &&
              sellectedEye == 1 &&
              sellectedSkin == 3) {
            iamgebulder = 'images/buildfoto/sienna-red-short.gif';
            sellectedHair = 2;
            sellectedEye = 1;
            sellectedSkin = 3;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          } else if (sellectedIamge == 8 &&
              control == 7 &&
              sellectedEye == 2 &&
              sellectedSkin == 1) {
            iamgebulder = 'images/buildfoto/white-blue-short.gif';
            sellectedHair = 2;
            sellectedEye = 2;
            sellectedSkin = 1;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          } else if (sellectedIamge == 8 &&
              control == 7 &&
              sellectedEye == 2 &&
              sellectedSkin == 2) {
            iamgebulder = 'images/buildfoto/porcrlan-blue-short.gif';
            sellectedHair = 2;
            sellectedEye = 2;
            sellectedSkin = 2;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          } else if (sellectedIamge == 8 &&
              control == 7 &&
              sellectedEye == 2 &&
              sellectedSkin == 3) {
            iamgebulder = 'images/buildfoto/sienna-red-short.gif';
            sellectedHair = 2;
            sellectedEye = 2;
            sellectedSkin = 3;
            globel.setsellecteddefult(sellecteddefult);
            globel.setsellectedEye(sellectedEye);
            globel.setsellectedSkin(sellectedSkin);
            globel.setsellectedHair(sellectedHair);
          }
        });
      },
      child: Image.asset(
        im,
        height: 60,
        width: 50,
        fit: BoxFit.fitHeight,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      borderSide: BorderSide(
        color: (sellectedIamge == index)
            ? Color.fromARGB(255, 77, 77, 77)
            : Color.fromARGB(255, 196, 215, 226),
        width: 2.5,
      ),
    );
  }
}

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height - 100);
    var controllPoint = Offset(50, size.height);
    var endpoint = Offset(size.height / 1.5, size.height);
    path.quadraticBezierTo(
        controllPoint.dx, controllPoint.dy, endpoint.dx, endpoint.dy);
    path.lineTo(size.width, size.height - 2);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
