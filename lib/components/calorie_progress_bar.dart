import 'package:calorie_diary/components/circle_painter.dart';
import 'package:calorie_diary/constants.dart';
import 'package:flutter/material.dart';

class CalorieProgressBar extends StatelessWidget {

  final int goalCalories;
  final int currentCalories;


  const CalorieProgressBar({Key? key, required this.goalCalories, required this.currentCalories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CirclePainter(goalCalories: goalCalories,currentCalories: currentCalories),
      size: const Size(200,200),
      child: SizedBox(
        height: 130,
        width: 130,
        child: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text('$goalCalories ',style: kSubTitleStyle.copyWith(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w700
            ),),
            Text('kcal',style: kSubTitleStyle.copyWith(
                color: Colors.black.withOpacity(.7),
                fontSize: 18,
                fontWeight: FontWeight.w700
            ),),
          ],
        )),)
    );
  }
}
