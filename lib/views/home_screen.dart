import 'package:calorie_diary/components/calorie_progress_bar.dart';
import 'package:calorie_diary/components/custom_circular_progress.dart';
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
  int goal = 1400;
  int current = 743;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightBackground,
      body:
      SafeArea(child:
        Padding(padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopCalendar(parentAction: (DateTime date){}),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Card(
                  color: Colors.white,
                  child: Row(
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
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Card(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('Steps',style: kSubTitleStyle.copyWith(color: Colors.black,fontSize: 20),),
                                Padding(
                                  padding: const EdgeInsets.only(left:10),
                                  child: Image.asset('assets/sneakers.png',scale: 1.7,),
                                ),


                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top:10.0,bottom: 20),
                              child: Center(child: CustomCircularProgress(goal: 1400, current: 743,)),
                            ),
                            Center(child: Text('$current steps',style: kSubTitleStyle.copyWith(color: Colors.black,fontSize: 20),))


                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Row(
                              children: [
                                Text('Water',style: kSubTitleStyle.copyWith(color: Colors.black),),
                                Padding(
                                  padding: const EdgeInsets.only(left:10),
                                  child: Image.asset('assets/sneakers.png',scale: 2,),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )



            ],
          ),
        ),),),
    );
  }
}
