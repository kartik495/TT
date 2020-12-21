import 'package:flutter/material.dart';
import 'package:tt/data/passenger_list_data.dart';

class Passenger extends StatefulWidget {
  @override
  _PassengerState createState() => _PassengerState();
}

class _PassengerState extends State<Passenger> {
  final textStyle = TextStyle(color: Colors.black, fontSize: 20);
  Map coach = data['coach'];
  String filter = 'Comfirmed Seats List';
  double height, width;

  Widget coachwidget({String coachName}) {
    return GestureDetector(
      onTap: () {
        if (filter == 'Comfirmed Seats List') {
          Navigator.pushNamed(context, '/confirmed',
              arguments: {'coachName': coachName});
        } else if (filter == 'Available Seats List') {
          Navigator.pushNamed(context, '/available',
              arguments: {'coachName': coachName});
        }
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
                setState(() {
                  filter = 'Comfirmed Seats List';
                });
              },
            ),
            ListTile(
              title: Text(
                'Available Seats',
                style: textStyle,
              ),
              onTap: () {
                setState(() {
                  filter = 'Available Seats List';
                });
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Center(
          child: Text(
            filter,
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
