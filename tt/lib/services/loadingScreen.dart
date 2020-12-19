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
  List<Widget> spinkit = [
    SpinKitWave(
      size: 60,
      color: Colors.green,
      type: SpinKitWaveType.start,
    ),
    SpinKitRotatingPlain(
      size: 60,
      color: Colors.green,
    ),
    SpinKitFoldingCube(
      size: 60,
      color: Colors.green,
    ),
    SpinKitRing(
      size: 60,
      color: Colors.green,
    ),
    SpinKitChasingDots(
      size: 60,
      color: Colors.green,
    ),
    SpinKitThreeBounce(
      size: 60,
      color: Colors.green,
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
