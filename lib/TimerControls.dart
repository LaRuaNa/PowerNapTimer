import 'package:flutter/material.dart';
import 'package:ruesy/ControlButton.dart';

class TimerControls extends StatelessWidget {
  const TimerControls({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Row(
          children: <Widget>[
            new ControlButton(icon: Icons.refresh, label: 'RESTART'),
            new Expanded(child: new Container()),
            new ControlButton(icon: Icons.arrow_back, label: 'RESET'),
          ],
        ),
        new ControlButton(icon: Icons.pause, label: 'PAUSE'),
      ],
    );
  }
}