import 'package:flutter/material.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:timeorganize/SignIn.dart';
import 'package:email_validator/email_validator.dart';
import 'package:timeorganize/character.dart';

class SginUp extends StatefulWidget {
  const SginUp({Key? key}) : super(key: key);

  @override
  _SginUpState createState() => _SginUpState();
}

class _SginUpState extends State<SginUp> {
  final _formkey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _isHidden = true;
  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffbfbfb),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            Pinned.fromPins(
              Pin(start: 0.0, end: 0.0),
              Pin(size: 170.0, start: 0.0),
              child: Stack(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(-0.857, 0.0),
                            end: Alignment(0.844, 0.0),
                            colors: [
                              Color(0xffebebeb),
                              Color(0xffebebeb),
                              Color(0xffd7ecfe)
                            ],
                            stops: [0.0, 0.236, 1.0],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      width: 180,
                      height: 10.0,
                      color: const Color(0xff1f1f1f),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(start: 190.0, end: 0.0),
                    Pin(size: 50.0, start: 110.0),
                    child: PageLink(
                      links: [
                        PageLinkInfo(
                          transition: LinkTransition.Fade,
                          ease: Curves.easeOut,
                          duration: 0.3,
                          pageBuilder: () => const SignIn(),
                        ),
                      ],
                      child: const Text(
                        'Sign-in',
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 25,
                          color: Color(0xff1f1f1f),
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                        softWrap: false,
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(start: 0.0, end: 180.0),
                    Pin(size: 50.0, start: 110.0),
                    child: const Text(
                      'Sign-up',
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 25,
                        color: Color(0xff1f1f1f),
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                      softWrap: false,
                    ),
                  ),
                ],
              ),
            ),
            //.....................................................................
            Form(
              key: _formkey,
              child: Pinned.fromPins(
                Pin(start: 35.0, end: 35.0),
                Pin(size: 400.0, start: 210),
                child: Column(
                  children: [
                    buildName(),
                    const SizedBox(
                      height: 20,
                    ),
                    buildEmail(),
                    const SizedBox(
                      height: 20,
                    ),
                    buildPassword(),
                    const SizedBox(
                      height: 30,
                    ),
                    buildSignUp()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
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
          //softWrap: false,
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 55,
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
            controller: _name,
            validator: (value) =>
                value!.length < 6 ? 'your name must lager then 6' : null,
            style: const TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 13,
              color: Color(0xff6b6464),
              fontWeight: FontWeight.w700,
            ),
            decoration: const InputDecoration(
                hintText: ' User Name',
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.person)),
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
          'E-mail',
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
          height: 5,
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 55,
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
            controller: _email,
            validator: (_email) =>
                _email != null && !EmailValidator.validate(_email)
                    ? 'Enter a valid email'
                    : null,
            style: const TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 13,
              color: Color(0xff6b6464),
              fontWeight: FontWeight.w700,
            ),
            decoration: const InputDecoration(
                // labelText: 'email',
                hintText: ' you@example.com',
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.email)),
          ),
        ),
      ],
    );
  }

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Password',
          style: TextStyle(
            fontFamily: 'Segoe UI',
            fontSize: 18,
            color: Color.fromARGB(255, 56, 56, 56),
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
          softWrap: false,
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 55,
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
            controller: _password,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (_password) => _password != null && _password.length < 6
                ? 'Enter minimum 6 characters'
                : null,
            obscureText: _isHidden,
            style: const TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 13,
              color: Color(0xff6b6464),
              fontWeight: FontWeight.w700,
            ),
            decoration: InputDecoration(
                hintText: ' Your Password',
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(top: 14),
                suffix: InkWell(
                  onTap: _togglePassWordView,
                  child: const Icon(Icons.visibility),
                ),
                prefixIcon: const Icon(Icons.vpn_key)),
          ),
        ),
      ],
    );
  }

  Widget buildSignUp() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: SizedBox(
            height: 60,
            width: 200,
            // ignore: deprecated_member_use
            child: RaisedButton(
              padding: const EdgeInsets.all(-1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              onPressed: signupTest,
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
                    'Sign Up',
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

  void _togglePassWordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  Future signupTest() async {
    final isValid = _formkey.currentState!.validate();
    if (!isValid) return;

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email.text.trim(),
        password: _password.text.trim(),
      );
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => character(
                    text: "Create your own character",
                  )),
          (Route<dynamic> route) => false);
    } on FirebaseAuthException catch (e) {
      print('something went wrong: $e');
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('this email already exists'),
      ));
    }
  }
}
