import 'package:flutter/material.dart';
import 'dart:math' as math;
class CirclePainter extends CustomPainter {

  late int goalCalories;
  late int currentCalories;
  CirclePainter({
    required this.currentCalories, required this.goalCalories
});




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

      math.pi*.75, //start angle
      currentCalories/goalCalories <= 1 ? math.pi*1.5*(currentCalories/goalCalories) :
      math.pi*1.5, //finish angle
      false,
      _paintProgress,
    );

    canvas.drawArc(

      Rect.fromCenter(
        center: Offset(size.height / 2, size.width / 2),
        height: size.height,
        width: size.width,
      ),

      math.pi*.75, //start angle
      math.pi*1.5, //finish angle
      false,
      _paintCircle,
    );

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}