import 'package:flutter/material.dart';
import 'dart:math' as math;
class StepsProgressPainter extends CustomPainter {

  late int current;
  late int goal;
  StepsProgressPainter({
    required this.current, required this.goal
  });


  double getRatio(){
    return current/goal;
  }




  final _paintCircle = Paint()
    ..color = Colors.orangeAccent.withOpacity(.5)
    ..strokeWidth = 16
    ..strokeCap = StrokeCap.round

  // Use [PaintingStyle.fill] if you want the circle to be filled.
    ..style = PaintingStyle.stroke;

  final _paintProgress = Paint()
    ..color = Colors.orangeAccent
    ..strokeWidth = 16
    ..strokeCap = StrokeCap.round

    ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawArc(

      Rect.fromCircle(
          center: Offset(size.height / 2, size.width / 2),
          radius: size.width/2
      ),

      math.pi/2, //start angle
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