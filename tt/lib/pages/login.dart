import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _formkey = GlobalKey<FormState>();

  var _username = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                'Login',
                style: TextStyle(fontSize: 35),
              ),
            ),
            Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      controller: _username,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          labelText: 'User Name',
                          labelStyle:
                              TextStyle(fontSize: 20, color: Colors.black)),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
