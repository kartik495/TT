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
  double height, width;

  Widget coachwidget({String coachName}) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/confirmed',
            arguments: {'coachName': coachName});
      },
      child: Container(
        decoration:
            BoxDecoration(color: Colors.white, border: Border.all(width: 1)),
        height: 50,
        width: width,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            coachName,
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
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
              padding: EdgeInsets.all(30),
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
        addRepaintBoundaries: true,
        children: coach.entries
            .map((entry) => coachwidget(coachName: entry.key))
            .toList(),
      ),
      backgroundColor: Colors.grey[300],
    );
  }
}
