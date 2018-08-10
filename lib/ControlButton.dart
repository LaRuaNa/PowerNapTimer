import 'package:flutter/material.dart';

class ControlButton extends StatelessWidget {
  final IconData icon;
  final String label;

  ControlButton({this.icon, this.label});

  @override
  Widget build(BuildContext context) {
    return new FlatButton(
        splashColor: const Color(0x22000000),
        onPressed: () {},
        child: new Padding(
          padding: const EdgeInsets.all(25.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.only(right: 3.0),
                child: new Icon(icon, color: Colors.black),
              ),
              new Text(label,
                  style:
                      const TextStyle(color: Colors.black, letterSpacing: 3.0))
            ],
          ),
        ));
  }
}
