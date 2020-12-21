import 'package:flutter/material.dart';
import 'package:tt/data/passenger_list_data.dart';

class Available extends StatefulWidget {
  @override
  _AvailableState createState() => _AvailableState();
}

class _AvailableState extends State<Available> {
  final textStyle = TextStyle(color: Colors.black, fontSize: 20);
  Map coach, stationOrder = data['stationOrder'];
  double height, width;
  int from = data['currentStation'], to;

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
    coach = data['coach'][coachName];
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Available Seats',
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Container(
            height: 60,
            width: width,
            color: Colors.grey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'From :',
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
                DropdownButton(
                    style: TextStyle(fontSize: 25, color: Colors.black),
                    value: from,
                    onChanged: (value) {
                      setState(() {
                        from = value;
                      });
                    },
                    items: stationOrder.keys
                        .toList()
                        .sublist(data['currentStation'] - 1)
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text('${data['stationOrder'][e]}'),
                            ))
                        .toList()),
                Text(
                  'To :',
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
                DropdownButton(
                    style: TextStyle(fontSize: 25, color: Colors.black),
                    value: to,
                    onChanged: (value) {
                      setState(() {
                        to = value;
                      });
                    },
                    items: stationOrder.keys
                        .toList()
                        .sublist(from)
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text('${data['stationOrder'][e]}'),
                            ))
                        .toList())
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: coach.entries
                  .map((entry) => coachwidget(
                      seatNumber: entry.key, seatDetail: entry.value))
                  .toList(),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey[300],
    );
  }
}
