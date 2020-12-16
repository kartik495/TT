import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _formkey = GlobalKey<FormState>();

  var _username = TextEditingController();
  var _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 35),
                ),
              ),
            ),
            Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8),
                        child: TextField(
                          controller: _username,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              labelText: 'User Name',
                              labelStyle:
                                  TextStyle(fontSize: 15, color: Colors.black)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8),
                        child: TextField(
                          controller: _password,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle:
                                  TextStyle(fontSize: 15, color: Colors.black)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 300,
                      child: GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Forgot Password',
                          textAlign: TextAlign.right,
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SizedBox(
                      width: 200,
                      height: 50,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        onPressed: () {},
                        color: Colors.black,
                        child: Text(
                          'SUMBIT',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      child: Text(
                        "Don't have account? Create Account",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
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
