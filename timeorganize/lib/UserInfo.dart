import 'package:flutter/material.dart';
import 'package:timeorganize/MyAppbar.dart';
import 'package:timeorganize/MyDrawer.dart';
import 'package:timeorganize/PasswordPage.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({
    Key? key,
  }) : super(key: key);

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              "images/User1.gif",
            ),
          )),
          SingleChildScrollView(
            padding: const EdgeInsets.all(12),
            child: Form(
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              frist(),
              const SizedBox(height: 20),
              buildName(),
              const SizedBox(height: 20),
              buildEmail(),
              const SizedBox(height: 20),
              buildMenuItem(
                text: 'Change Password',
                icon: Icons.change_circle_outlined,
                onClicked: () => selectedItem(context, 1),
              ),
              const SizedBox(height: 40),
              buildSave(),
            ])),
          )
        ],
      ),
    );
  }

  Widget frist() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "",
          style: TextStyle(
            fontFamily: 'Segoe UI',
            fontSize: 30,
            color: Color.fromARGB(0, 31, 31, 31),
            fontWeight: FontWeight.w700,
          ),
        ),
        const Text(
          "User information",
          style: TextStyle(
            fontFamily: 'Segoe UI',
            fontSize: 22,
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

  Widget buildName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Name',
          style: TextStyle(
            fontFamily: 'Segoe UI',
            fontSize: 20,
            color: Color.fromARGB(255, 56, 56, 56),
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 50,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment(0.0, -1.0),
              end: Alignment(0.0, 1.0),
              colors: [Color(0xffebebeb), Color(0xffd7ecfe)],
              stops: [0.0, 1.0],
            ),
            borderRadius: BorderRadius.circular(37.0),
            border: Border.all(width: 1.0, color: const Color(0xff6b6464)),
          ),
          child: const TextField(
            //controller: _name,
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 15,
              color: Color(0xff6b6464),
              fontWeight: FontWeight.w700,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(10),
              hintText: 'name',
              hintStyle: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 15,
                color: Color(0xff707070),
                fontWeight: FontWeight.w700,
              ),
              errorStyle: TextStyle(
                color: Color.fromARGB(255, 165, 83, 83),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Account',
          style: TextStyle(
            fontFamily: 'Segoe UI',
            fontSize: 20,
            color: Color.fromARGB(255, 56, 56, 56),
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
          //softWrap: false,
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 50,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment(0.0, -1.0),
              end: Alignment(0.0, 1.0),
              colors: [Color(0xffebebeb), Color(0xffd7ecfe)],
              stops: [0.0, 1.0],
            ),
            borderRadius: BorderRadius.circular(37.0),
            border: Border.all(width: 1.0, color: const Color(0xff6b6464)),
          ),
          child: const TextField(
            //controller: _email,
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 15,
              color: Color(0xff6b6464),
              fontWeight: FontWeight.w700,
            ),
            decoration: InputDecoration(
              hintText: 'Account',
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(10),
              hintStyle: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 15,
                color: Color(0xff707070),
                fontWeight: FontWeight.w700,
              ),
              errorStyle: TextStyle(
                color: Color.fromARGB(255, 165, 83, 83),
              ),
            ),
          ),
        ),
      ],
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
          builder: (context) => PasswordPage(),
        ));
        break;
    }
  }

  Widget buildSave() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: SizedBox(
            height: 50,
            width: 150,
            // ignore: deprecated_member_use
            child: RaisedButton(
              padding: const EdgeInsets.all(-1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              onPressed: () {},
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
                    'Save',
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
}
