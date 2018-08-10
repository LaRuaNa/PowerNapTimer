import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ruesy/DialKnob.dart';

final Color GRADIENT_TOP = const Color(0xFFF5F5F5);
final Color GRADIENT_BOTTOM = const Color(0xFFE8E8E8);

class Dial extends StatefulWidget {
  final Duration currentTime;
  final Duration maxTime;
  final int tickPerSection;

  Dial({
    this.currentTime = const Duration(minutes: 0),
    this.maxTime = const Duration(minutes: 35),
    this.tickPerSection = 5,
  });

  @override
  _DialState createState() => new _DialState();
}

class _DialState extends State<Dial> {
  _getRotationInPercent() {
    return widget.currentTime.inSeconds / widget.maxTime.inSeconds;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      child: new Padding(
        padding: EdgeInsets.only(left: 45.0, right: 45.0),
        child: new AspectRatio(
          aspectRatio: 1.0,
          child: new Container(
            decoration: new BoxDecoration(
                shape: BoxShape.circle,
                gradient: new LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [GRADIENT_TOP, GRADIENT_BOTTOM]),
                boxShadow: [
                  new BoxShadow(
                    color: const Color(0x44000000),
                    blurRadius: 2.0,
                    spreadRadius: 1.0,
                    offset: const Offset(0.0, 1.0),
                  )
                ]),
            child: new Stack(
              children: [
                Container(
                    width: double.infinity,
                    height: double.infinity,
                    padding: const EdgeInsets.all(55.0),
                    child: new CustomPaint(
                        painter: new TickPainter(
                            tickCount: widget.maxTime.inMinutes,
                            ticksPerSection: widget.tickPerSection))),
                new Padding(
                  padding: const EdgeInsets.all(65.0),
                  child:
                      new DialKnob(rotationInPercent: _getRotationInPercent()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TickPainter extends CustomPainter {
  final LONG_TICK = 14.0;
  final SHORT_TICK = 4.0;

  final tickCount;
  final ticksPerSection;
  final ticksInset;
  final tickPaint;
  final textPainter;
  final textStyle;

  TickPainter({
    this.tickCount = 35,
    this.ticksPerSection = 5,
    this.ticksInset = 0.0,
  })  : tickPaint = new Paint(),
        textPainter = new TextPainter(
            textAlign: TextAlign.center, textDirection: TextDirection.ltr),
        textStyle = const TextStyle(color: Colors.black) {
    tickPaint.color = Colors.black;
    tickPaint.strokeWidth = 1.5;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    canvas.save();

    final radius = size.width / 2;

    for (var i = 0; i < tickCount; i++) {
      final tickLength = i % ticksPerSection == 0 ? LONG_TICK : SHORT_TICK;

      canvas.drawLine(new Offset(0.0, -radius),
          new Offset(0.0, -radius - tickLength), tickPaint);

      if (i % ticksPerSection == 0) {
        canvas.save();
        canvas.translate(0.0, -(size.width / 2) - 30.0);

        textPainter.text = new TextSpan(text: '$i', style: textStyle);
        textPainter.layout();

        final tickPercent = i / tickCount;
        var quadrant;

        if (tickPercent < 0.25) {
          quadrant = 1;
        } else if (tickPercent < 0.5) {
          quadrant = 4;
        } else if (tickPercent < 0.75) {
          quadrant = 3;
        } else {
          quadrant = 2;
        }

        switch (quadrant) {
          case 4:
            canvas.rotate(-PI / 2);
            break;
          case 2:
          case 3:
            canvas.rotate(PI / 2);
            break;
        }

        textPainter.paint(
          canvas,
          new Offset(
            -textPainter.width / 2,
            -textPainter.height / 2,
          ),
        );

        canvas.restore();
      }

      canvas.rotate(2 * PI / tickCount);
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
