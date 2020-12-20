import 'dart:convert';

import 'package:flutter/material.dart';

class Passenger extends StatefulWidget {
  @override
  _PassengerState createState() => _PassengerState();
}

class _PassengerState extends State<Passenger> {
  final textStyle = TextStyle(color: Colors.black, fontSize: 20);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text(
                'Passenger List Filters',
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
        children: [],
      ),
      backgroundColor: Colors.grey[300],
    );
  }
}
Map createTTData(){
    var trainNumber=123456;
    int numberOfStations=27;
    List stationOrder;
    for (int i=0;i<26;i++){
      stationOrder.add(String.fromCharCode(65+i));
      }
    Map stationDetail;
    for (int i=0;i<26;i++){
      stationDetail[String.fromCharCode(65+i)]={'name':'${String.fromCharCode(65+i)} Railway Station','position':i};
      }
    

    var lastStation='A';
    def seatData():
        data={}
        end=1
        status:str='A'
        numberOfPassenger=0
        while end<25:
            start=randint(end,25)
            end=randint(start+1,26)
            numberOfPassenger+=1
            if start==1:
                status='NA'
            data[f'passenger {numberOfPassenger}']={'from':stationOrder[start],'to':stationOrder[end],'id':numberOfPassenger,'status':'Confirmed'}
        data['status']=status
        data['numberOfPassenger']=numberOfPassenger
        return data
    coach={'S'+str(i):{i:seatData() for i in range(1,100)} for i in range(1,15)}
    return {'trainNumber':trainNumber,'totalStation':numberOfStations,'stationOrder':stationOrder,'stationDetail':stationDetail,'currentStation':lastStation,'coach':coach}
}