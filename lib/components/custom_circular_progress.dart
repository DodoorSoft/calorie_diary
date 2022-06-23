
import 'package:calorie_diary/components/progress_painter.dart';
import 'package:calorie_diary/constants.dart';
import 'package:flutter/material.dart';

class CustomCircularProgress extends StatelessWidget {

  final int goal;
  final int current;



  const CustomCircularProgress({Key? key, required this.goal, required this.current}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        painter: ProgressPainter(goal:goal,current:current),
        size: const Size(200,200),
        child: SizedBox(
          height: 130,
          width: 130,
          child: Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Goal:',style: kSubTitleStyle.copyWith(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w700)),
              Text('$goal steps',style: kSubTitleStyle.copyWith(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w700
              ),),

            ],
          )),)
    );
  }
}
