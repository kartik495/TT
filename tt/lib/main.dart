import 'package:flutter/material.dart';
import 'pages/loading.dart';
import 'package:tt/pages/login.dart';
import 'pages/signup.dart';
import 'pages/dashboard.dart';
import 'pages/passenger.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/passenger',
    routes: {
      '/loading': (context) => Loading(),
      '/login': (context) => Login(),
      '/signup': (context) => SignUp(),
      '/dashboard': (context) => Dashboard(),
      '/passenger': (context) => Passenger(),
    },
  ));
}
