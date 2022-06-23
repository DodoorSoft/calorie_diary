import 'package:flutter/material.dart';
import 'dart:math' as math;
class ProgressPainter extends CustomPainter {

  late int current;
  late int goal;
  ProgressPainter({
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

  // Use [PaintingStyle.fill] if you want the circle to be filled.
    ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawArc(

      Rect.fromCenter(
        center: Offset(size.height / 2, size.width / 2),
        height: size.height,
        width: size.width,
      ),

      math.pi/2, //start angle
      getRatio() <= 1 ? math.pi*2*getRatio() :
      math.pi*2, //finish angle
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