import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  void nextpage(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/signup');
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () => nextpage(context));
    return Container(
      color: Colors.white,
      child: Center(
          child: Image(
        image: new AssetImage('asset/icon.png'),
      )),
    );
  }
}
