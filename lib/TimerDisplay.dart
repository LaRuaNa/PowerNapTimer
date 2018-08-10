import 'package:flutter/material.dart';

class TimerDisplay extends StatefulWidget {
  _TimerDisplayState createState() => new _TimerDisplayState();
}

class _TimerDisplayState extends State<TimerDisplay> {
  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: new Text(
        '15:23',
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 100.0,
          letterSpacing: 10.0,
        ),
      ),
    );
  }
}
