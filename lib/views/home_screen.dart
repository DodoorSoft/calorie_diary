import 'package:calorie_diary/components/calorie_progress_bar.dart';
import 'package:calorie_diary/components/custom_card.dart';
import 'package:calorie_diary/components/macros.dart';
import 'package:calorie_diary/components/top_calendar.dart';
import 'package:calorie_diary/constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  DateTime today = DateTime.now();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightBackground,
      body:
      SafeArea(child:
        Padding(padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TopCalendar(parentAction: (DateTime date){}),
              Padding(
                padding: const EdgeInsets.only(left:10.0,right: 10,top: 40),
                child: CustomCard(
                  cardChild: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top:20.0),
                        child: CalorieProgressBar(goalCalories: 2600,currentCalories: 1300,),
                      ),
                      SizedBox(
                        height: 190,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Macros(macroType: 'Carbs', macroAmount: 120,boxColor: Colors.blue,),
                            Macros(macroType: 'Protein', macroAmount: 60,boxColor: Colors.red,),
                            Macros(macroType: 'Fat', macroAmount: 30,boxColor: Colors.amber,)
                          ],
                        ),
                      )
                    ],
                  ),
                  cardColor: Colors.blue,
                ),
              ),

            ],
          ),
        ),),),
    );
  }
}
