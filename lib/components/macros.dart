import 'package:calorie_diary/constants.dart';
import 'package:flutter/material.dart';

class Macros extends StatelessWidget {

  final String macroType;
  final double macroAmount;
  final Color boxColor;


  const Macros({Key? key, required this.macroType, required this.macroAmount,
  required this.boxColor}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: Container(
                width: 5,
                height: 20,
                decoration: BoxDecoration(
                  color: boxColor,
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
            ),
            Text(macroType,style: kSubTitleStyle.copyWith(color: Colors.grey)),
          ],
        ),
        Text('${macroAmount}g',style: kSubTitleStyle.copyWith(color: Colors.black,fontSize: 20))
      ],
    );
  }
}
