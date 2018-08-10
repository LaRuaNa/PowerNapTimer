import 'package:flutter/material.dart';
import 'package:ruesy/TimerControls.dart';
import 'package:ruesy/TimerDisplay.dart';
import 'package:ruesy/Dial.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        decoration: new BoxDecoration(
            gradient: new LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [GRADIENT_TOP, GRADIENT_BOTTOM])),
        child: new Center(
          child: new Column(
            children: [
              new TimerDisplay(),
              new Expanded(child: new Container()),
              new Dial(),
              new Expanded(child: new Container()),
              new TimerControls(),
            ],
          ),
        ),
      ),
    );
  }
}

