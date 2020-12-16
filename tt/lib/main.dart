import 'package:flutter/material.dart';
import 'pages/loading.dart';
import 'package:tt/pages/login.dart';
import 'pages/signup.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/signup',
    routes: {
      '/loading': (context) => Loading(),
      '/login': (context) => Login(),
      '/signup': (context) => SignUp(),
    },
  ));
}
