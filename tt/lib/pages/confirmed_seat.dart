import 'package:flutter/material.dart';
import 'package:tt/data/passenger_list_data.dart';

class Confirmed extends StatefulWidget {
  @override
  _ConfirmedState createState() => _ConfirmedState();
}

class _ConfirmedState extends State<Confirmed> {
  final textStyle = TextStyle(color: Colors.black, fontSize: 20);
  String coachName;
  double height, width;
  final stationOrder = data['stationOrder'];

  showSeatDetail(BuildContext context, {String seatInfo, Map passengerInfo}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(seatInfo),
            content: Container(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'From : ${stationOrder[passengerInfo['from']]}    To : ${stationOrder[passengerInfo['to']]}',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Name - ${passengerInfo['name']}',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'ID - ${passengerInfo['id']}',
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
              ),
            ),
            actions: [
              RaisedButton(
                onPressed: () {},
                color: Colors.green,
                child: Center(
                    child: Text(
                  'Confirmed',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                )),
              ),
              RaisedButton(
                onPressed: () {},
                color: Colors.red,
                child: Center(
                    child: Text(
                  'Available',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                )),
              ),
              FlatButton(
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                  child: Text('CANCEL'))
            ],
          );
        });
  }

  Widget coachwidget({int seatNumber, Map seatDetail}) {
    bool status = false;
    if (seatDetail['currentPassenger'] !=
        0) if (seatDetail[seatDetail['currentPassenger']]
            ['status'] ==
        'Not Confirmed') {
      status = true;
    }
    return status
        ? GestureDetector(
            onTap: () {
              showSeatDetail(context,
                  seatInfo: 'Coach - $coachName Seat - $seatNumber',
                  passengerInfo: seatDetail[seatDetail['currentPassenger']]);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, border: Border.all(width: 1)),
              height: 60,
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
    coachName = arguments['coachName'];
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
