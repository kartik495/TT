import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Map work_details = {
    'time': DateTime.now(),
    'train': {'name': 'abc', 'number': 123},
    'station': 'A',
    'platform': 2
  };

  Padding detail(Map work) {
    TextStyle textStyle = TextStyle(color: Colors.black, fontSize: 20);
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/passenger');
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Time - ${work['time'].hour}:${work['time'].minute}',
                    style: textStyle,
                  ),
                  Text(
                    'Date - ${work['time'].day}/${work['time'].month}/${work['time'].year}',
                    style: textStyle,
                  ),
                  Text(
                    'Train - ${work['train']['number']}  ${work['train']['name']}',
                    style: textStyle,
                  ),
                  Text(
                    'Station - ${work['station']}',
                    style: textStyle,
                  ),
                  Text(
                    'Platform No.- ${work['platform']}',
                    style: textStyle,
                  )
                ],
              ),
            ),
          ),
          color: Colors.white,
          shadowColor: Colors.black,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'DASHBOARD',
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          detail(work_details),
          detail(work_details),
          detail(work_details),
          detail(work_details),
          detail(work_details),
          detail(work_details),
          detail(work_details),
          detail(work_details),
        ],
      ),
      backgroundColor: Colors.grey[300],
    );
  }
}
