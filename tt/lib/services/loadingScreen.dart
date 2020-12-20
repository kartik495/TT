import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:math';

showAlertDilogue(BuildContext context, {String title, String message}) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            FlatButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                },
                child: Text('OK'))
          ],
        );
      });
}

// ignore: missing_return
Widget showProcessing(BuildContext context) {
  var random = new Random();
  final color = Colors.black;
  List<Widget> spinkit = [
    SpinKitWave(
      size: 60,
      color: color,
      type: SpinKitWaveType.start,
    ),
    SpinKitRotatingPlain(
      size: 60,
      color: color,
    ),
    SpinKitFoldingCube(
      size: 60,
      color: color,
    ),
    SpinKitRing(
      size: 60,
      color: color,
    ),
    SpinKitChasingDots(
      size: 60,
      color: color,
    ),
    SpinKitThreeBounce(
      size: 60,
      color: color,
    ),
  ];

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            backgroundColor: Colors.transparent,
            content: SizedBox(child: spinkit[random.nextInt(spinkit.length)]));
      });
}
