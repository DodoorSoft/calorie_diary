
import 'package:calorie_diary/components/litres_progress_painter.dart';
import 'package:calorie_diary/constants.dart';
import 'package:flutter/material.dart';

class LitresCircularProgress extends StatelessWidget {

  final double goal;
  final double current;



  const LitresCircularProgress({Key? key, required this.goal, required this.current}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        painter: LitresProgressPainter(goal:goal,current:current),
        size: const Size(200,200),
        child: SizedBox(
          height: 130,
          width: 130,
          child: Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$goal',style: kSubTitleStyle.copyWith(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w700)),
              Text('Litres',style: kSubTitleStyle.copyWith(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w700
              ),),

            ],
          )),)
    );
  }
}
