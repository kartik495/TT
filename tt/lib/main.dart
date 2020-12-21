import 'package:flutter/material.dart';
import 'pages/loading.dart';
import 'package:tt/pages/login.dart';
import 'pages/signup.dart';
import 'pages/dashboard.dart';
import 'pages/passenger.dart';
import 'pages/confirmed_seat.dart';
import 'pages/available_seat.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/passenger',
    routes: {
      '/loading': (context) => Loading(),
      '/login': (context) => Login(),
      '/signup': (context) => SignUp(),
      '/confirmed': (context) => Confirmed(),
      '/dashboard': (context) => Dashboard(),
      '/passenger': (context) => Passenger(),
      '/available': (context) => Available(),
    },
  ));
}
