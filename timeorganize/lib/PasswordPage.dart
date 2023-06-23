import 'package:flutter/material.dart';
import 'package:timeorganize/MyAppbar.dart';
import 'package:timeorganize/MyDrawer.dart';

class PasswordPage extends StatefulWidget {
  PasswordPage({Key? key}) : super(key: key);

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  final passwordController1 = TextEditingController();
  final passwordController2 = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool _isHidden1 = true;
  bool _isHidden2 = true;
  bool _isHidden3 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFFBFBFB),
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
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                buildPassword(),
                const SizedBox(
                  height: 25,
                ),
                buildCurrentPassword(),
                const SizedBox(
                  height: 20,
                ),
                buildNewPassword(),
                const SizedBox(
                  height: 20,
                ),
                buildConfirmPassword(),
                const SizedBox(
                  height: 50,
                ),
                buildSave()
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "",
          style: TextStyle(
            fontFamily: 'Segoe UI',
            fontSize: 20,
            color: Color.fromARGB(0, 31, 31, 31),
            fontWeight: FontWeight.w700,
          ),
        ),
        const Text(
          "Password setting",
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

  Widget buildCurrentPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Current Password',
          style: TextStyle(
            fontFamily: 'Segoe UI',
            fontSize: 18,
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
          child: TextField(
            //controller: _name,
            obscureText: _isHidden1,
            style: const TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 15,
              color: Color(0xff6b6464),
              fontWeight: FontWeight.w700,
            ),
            decoration: InputDecoration(
              // hintText: '****',
              hintStyle: const TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 17,
                color: Color(0xff707070),
                fontWeight: FontWeight.w700,
              ),
              suffix: IconButton(
                onPressed: () {
                  _togglePasswordView1();
                },
                icon: const Icon(
                  Icons.visibility,
                ),
              ),
              prefixIcon: Icon(Icons.vpn_key),
              border: InputBorder.none,
              errorStyle: const TextStyle(
                color: Color.fromARGB(255, 165, 83, 83),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildNewPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'New Password',
          style: TextStyle(
            fontFamily: 'Segoe UI',
            fontSize: 18,
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
          child: TextFormField(
            controller: passwordController1,
            validator: (password) =>
                password!.length < 6 ? 'your pas must lager then 6' : null,
            obscureText: _isHidden2,
            style: const TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 15,
              color: Color(0xff6b6464),
              fontWeight: FontWeight.w700,
            ),
            decoration: InputDecoration(
              //   hintText: ' Your Password',
              hintStyle: const TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 15,
                color: Color(0xff707070),
                fontWeight: FontWeight.w700,
              ),
              errorStyle: const TextStyle(
                color: Color.fromARGB(255, 165, 83, 83),
              ),
              border: InputBorder.none,

              suffix: IconButton(
                onPressed: () {
                  _togglePasswordView2();
                },
                icon: const Icon(
                  Icons.visibility,
                ),
              ),
              prefixIcon: const Icon(Icons.vpn_key),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildConfirmPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Confirm Password',
          style: TextStyle(
            fontFamily: 'Segoe UI',
            fontSize: 18,
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
          child: TextFormField(
            controller: passwordController2,
            validator: (password) =>
                passwordController2 != passwordController1 ? 'not eq' : null,
            obscureText: _isHidden3,
            style: const TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 15,
              color: Color(0xff6b6464),
              fontWeight: FontWeight.w700,
            ),
            decoration: InputDecoration(
              //  hintText: ' Your Password',
              hintStyle: const TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 15,
                color: Color(0xff707070),
                fontWeight: FontWeight.w700,
              ),
              errorStyle: const TextStyle(
                color: Color.fromARGB(255, 165, 83, 83),
              ),
              suffix: IconButton(
                onPressed: () {
                  _togglePasswordView3();
                },
                icon: const Icon(
                  Icons.visibility,
                ),
              ),
              prefixIcon: Icon(Icons.vpn_key),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
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
              onPressed: () {
                if (_formkey.currentState?.validate != null) {
                  print(passwordController1);
                }
              },
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

  void _togglePasswordView1() {
    setState(() {
      _isHidden1 = !_isHidden1;
    });
  }

  void _togglePasswordView2() {
    setState(() {
      _isHidden2 = !_isHidden2;
    });
  }

  void _togglePasswordView3() {
    setState(() {
      _isHidden3 = !_isHidden3;
    });
  }
}
