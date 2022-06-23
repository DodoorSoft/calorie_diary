import 'package:flutter/material.dart';
import 'dart:math' as math;
class LitresProgressPainter extends CustomPainter {

  late double current;
  late double goal;
  LitresProgressPainter({
    required this.current, required this.goal
  });


  double getRatio(){
    return current/goal;
  }




  final _paintCircle = Paint()
    ..color = Colors.blueAccent.withOpacity(.5)
    ..strokeWidth = 16
    ..strokeCap = StrokeCap.round

  // Use [PaintingStyle.fill] if you want the circle to be filled.
    ..style = PaintingStyle.stroke;

  final _paintProgress = Paint()
    ..color = Colors.blueAccent
    ..strokeWidth = 16
    ..strokeCap = StrokeCap.round

    ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawArc(

      Rect.fromCircle(
        center: Offset(size.height / 2, size.width / 2),
        radius: size.width/2
      ),

      0.5*math.pi - math.pi*getRatio(), //start angle
      math.pi*getRatio()*2, //finish angle
      false,
      _paintProgress,
    );

    canvas.drawArc(

      Rect.fromCenter(
        center: Offset(size.height / 2, size.width / 2),
        height: size.height,
        width: size.width,
      ),

      math.pi*2, //start angle
      math.pi*2, //finish angle
      false,
      _paintCircle,
    );

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}