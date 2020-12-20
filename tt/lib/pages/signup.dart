import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:tt/services/loadingScreen.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var _formkey = GlobalKey<FormState>();
  var _adharnumber = TextEditingController();
  var _email = TextEditingController();
  var _phonenumber = TextEditingController();
  var _username = TextEditingController();

  void verifyuser(BuildContext context) async {
    showProcessing(context);
    var url =
        'http://127.0.0.1:8000/check_user?aadhar=${_adharnumber.text}&email=${_email.text}&mobile=${_phonenumber.text}&username=${_username.text}';
    final response = await get(url);
    Navigator.of(context, rootNavigator: true).pop();
    if (response.statusCode == 200) {
      Navigator.pushReplacementNamed(context, '/dashboard');
    } else {
      showAlertDilogue(context,
          title: 'SignUp Failed',
          message: 'You have either entered wrong details');
    }
  }

  @override
  void initState() {
    super.initState();
    _adharnumber.text = '1234';
    _email.text = 'user@gmail.com';
    _phonenumber.text = '1234';
    _username.text = 'user';
  }

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
                  'SignUp',
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
                          controller: _email,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              labelText: 'Email Address',
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
                          controller: _adharnumber,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              labelText: 'Aadhar Number',
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
                          controller: _phonenumber,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              labelText: 'Phone Number',
                              labelStyle:
                                  TextStyle(fontSize: 15, color: Colors.black)),
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
                        onPressed: () {
                          verifyuser(context);
                        },
                        color: Colors.black,
                        child: Text(
                          'SUMBIT',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
