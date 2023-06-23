import 'package:flutter/material.dart';
import 'package:timeorganize/SginUp.dart';
import 'package:timeorganize/SignIn.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) =>
      isLogin ? const SignIn() : const SginUp();

  //void toggle() => setState(() => isLogin = !isLogin);
}
