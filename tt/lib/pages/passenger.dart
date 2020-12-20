import 'package:flutter/material.dart';
import 'package:tt/data/passenger_list_data.dart';

class Passenger extends StatefulWidget {
  @override
  _PassengerState createState() => _PassengerState();
}

class _PassengerState extends State<Passenger> {
  final textStyle = TextStyle(color: Colors.black, fontSize: 20);
  Map coach = data['coach'];
  String coachShow = '';

  Widget coachwidget({String coachNumber, Map seat}) {
    bool show = coachShow == coachNumber ? true : false;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {});
            coachShow = coachNumber;
          },
          child: Container(
            color: Colors.grey[300],
            height: 50,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                coachNumber,
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          ),
        ),
        show
            ? Container(
                height: 200,
                child: ListView(
                  children: seat.entries.map((e) => Text('${e.key}')).toList(),
                ),
              )
            : Container()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text(
                'Passenger List Filters for ${data['trainNumber']} ',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 30),
              ),
              padding: EdgeInsets.all(40),
            ),
            ListTile(
              title: Text(
                'Confirmed Seats',
                style: textStyle,
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text(
                'Available Seats',
                style: textStyle,
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text(
                'Seats to be Confirmed',
                style: textStyle,
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Center(
          child: Text(
            'Passenger List',
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: coach.entries
            .map((entry) =>
                coachwidget(coachNumber: entry.key, seat: entry.value))
            .toList(),
      ),
      backgroundColor: Colors.grey[300],
    );
  }
}
