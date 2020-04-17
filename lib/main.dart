import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'App 02'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var waterData = 1;
  var tempData = 1;

  Timer _timer;
  int _start = 10;

  void randomData() {
    // water: 50 - 90 %
    waterData = Random().nextInt(40) + 50;
    // tempData: 22 - 37
    tempData = Random().nextInt(15) + 22;
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = new Timer.periodic
      (oneSec, (Timer timer) => setState(() {
          // if(_start < 1) _start = 10;
          // else {
            randomData();
          //   _start = _start - 1;
          // }
        })
      );
  }

  @override
  Widget build(BuildContext context) {

    final cardInfo = Card(
      color: Colors.white,      
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),
        child: Column(
          children: <Widget>[

            ListTile(
              leading: Image.asset('images/water.png', scale: 0.5),
              title: Text('Water: $waterData %', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Up: 14/4/2020 5:10 AM', style: TextStyle(fontWeight: FontWeight.bold)),
            ),

            ListTile(
              leading: Image.asset('images/thermo2.png', scale: 0.5),
              title: Text('Temperature: $tempData C', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Up: 14/4/2020 5:10 AM', style: TextStyle(fontWeight: FontWeight.bold)),
            ),

            ButtonBar(
              buttonPadding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 20.0),
              alignment: MainAxisAlignment.center,
              buttonHeight: 40.0, buttonMinWidth: 50.0, 
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      startTimer();                      
                    });
                  },
                  child: Text('START', style: TextStyle(fontWeight: FontWeight.bold)),
                  color: Colors.green,
                ),
              ],
            ),
          ],
        )
      )
    );

    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text(widget.title, style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,            
            children: <Widget>[
              Container(
                width: 300.0, height: 280.0,
                child: cardInfo,
              ),
              Divider(                              
                color: Colors.green,
                indent: 60.0, endIndent: 60.0,
                thickness: 1.0,
              ),
              FloatingActionButton(
                onPressed: () {
                  setState((){
                    startTimer();

                    // randomData();
                  });
                },
                backgroundColor: Colors.white,
                child: Icon(Icons.add, color: Colors.green),
              )
            ],
          ),
        ),
      ),
    );
  }
}
