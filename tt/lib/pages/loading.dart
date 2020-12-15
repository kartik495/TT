import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
          child: Image(
        image: new AssetImage('asset/icon.png'),
      )),
    );
  }
}
