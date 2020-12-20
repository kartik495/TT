import 'package:flutter/material.dart';
import 'package:tt/data/passenger_list_data.dart';

class Confirmed extends StatefulWidget {
  @override
  _ConfirmedState createState() => _ConfirmedState();
}

class _ConfirmedState extends State<Confirmed> {
  final textStyle = TextStyle(color: Colors.black, fontSize: 20);

  double height, width;

  Widget coachwidget({int seatNumber, Map seatDetail}) {
    bool status = seatDetail['status'] == 'NA';
    return status
        ? GestureDetector(
            onTap: () {
              setState(() {});
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, border: Border.all(width: 1)),
              height: 50,
              width: width,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  seatNumber.toString(),
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
            ),
          )
        : Container();
  }

  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context).settings.arguments;
    final coachName = arguments['coachName'];
    Map coach = data['coach'][coachName];
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Confirmed List',
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        addRepaintBoundaries: true,
        children: coach.entries
            .map((entry) =>
                coachwidget(seatNumber: entry.key, seatDetail: entry.value))
            .toList(),
      ),
      backgroundColor: Colors.grey[300],
    );
  }
}
