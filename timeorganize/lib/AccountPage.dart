import 'package:flutter/material.dart';
import 'package:timeorganize/SginUp.dart';
import 'package:timeorganize/MyAppbar.dart';
import 'package:timeorganize/MyDrawer.dart';
import 'package:timeorganize/PasswordPage.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xffd7ecfe),
        appBar: MyAppbar(),
        drawer: MyDrawer(),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close)),
            ],
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Form(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              const Text(
                'Account',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 30,
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                style: const TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 13,
                  color: Color(0xff6b6464),
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Name',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 30,
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              TextFormField(
                style: const TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 13,
                  color: Color(0xff6b6464),
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(height: 16),
              buildMenuItem(
                text: 'Change password',
                onClicked: () => selectedItem(context, 1),
              ),
              const SizedBox(height: 16),
              buildMenuItem(
                text: 'LogOut',
                onClicked: () => selectedItem(context, 2),
              ),
            ]),
          ),
        ));
  }

  Widget buildMenuItem({
    required String text,
    VoidCallback? onClicked,
  }) {
    final color = Color.fromARGB(255, 56, 56, 56);

    final hoverColor = Color.fromARGB(255, 235, 235, 235);

    return ListTile(
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
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const SginUp(),
        ));
        break;
    }
  }
}
