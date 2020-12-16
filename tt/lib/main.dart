import 'package:flutter/material.dart';
import 'pages/loading.dart';
import 'package:tt/pages/login.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/loading',
    routes: {
      '/loading': (context) => Loading(),
      '/login': (context) => Login(),
    },
  ));
}
