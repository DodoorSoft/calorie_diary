import 'package:calorie_diary/components/calorie_progress_bar.dart';
import 'package:calorie_diary/components/litres_circular_progress.dart';
import 'package:calorie_diary/components/macros.dart';
import 'package:calorie_diary/components/steps_progress_bar.dart';
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

  int goalCal = 2600;
  int currentCal = 800;

  double goalLitres = 4;
  double currentLitres = 1.5;


  int stepsTaken = 1200;
  int goalSteps = 1600;


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
              Row(
                children: [
                  CircleAvatar(radius: 30,
                  backgroundColor: kLightBackground,
                  backgroundImage: NetworkImage(''),),
                  Padding(
                    padding: EdgeInsets.only(left:12.0),
                    child: Text('Hello, Tolga',style: kTitleStyle,),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 0.5,
                        blurRadius: 0.5,
                        offset: const Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top:20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text('$currentCal kcal',style: kSubTitleStyle.copyWith(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600
                                ),),
                                Padding(
                                  padding: const EdgeInsets.only(top:8.0),
                                  child: Text('Consumed',style: kSubTitleStyle.copyWith(
                                    color: Colors.black54,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500
                                  ),),
                                )
                              ],
                            ),
                            CalorieProgressBar(goalCalories: goalCal,currentCalories: currentCal,),
                            Column(
                              children: [
                                Text('${goalCal-currentCal} kcal',style: kSubTitleStyle.copyWith(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600
                                ),),
                                Padding(
                                  padding: const EdgeInsets.only(top:8.0),
                                  child: Text('Remaining',style: kSubTitleStyle.copyWith(
                                      color: Colors.black54,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500
                                  ),),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:15.0,bottom: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 0.5,
                        blurRadius: 0.5,
                        offset: const Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top:20.0,bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text('${currentLitres.toStringAsFixed(1)} litres',style: kSubTitleStyle.copyWith(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600
                                ),),
                                Padding(
                                  padding: const EdgeInsets.only(top:8.0),
                                  child: Text('Drank',style: kSubTitleStyle.copyWith(
                                      color: Colors.black54,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500
                                  ),),
                                )
                              ],
                            ),
                            LitresCircularProgress(goal: goalLitres,current: currentLitres,),
                            Column(
                              children: [
                                Text('${(goalLitres-currentLitres).toStringAsFixed(1)} litres',style: kSubTitleStyle.copyWith(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600
                                ),),
                                Padding(
                                  padding: const EdgeInsets.only(top:8.0),
                                  child: Text('Remaining',style: kSubTitleStyle.copyWith(
                                      color: Colors.black54,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500
                                  ),),
                                )
                              ],
                            )
                          ],
                        ),
                      ),


                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 0.5,
                        blurRadius: 0.5,
                        offset: const Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top:20.0,bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text('$stepsTaken steps',style: kSubTitleStyle.copyWith(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600
                                ),),
                                Padding(
                                  padding: const EdgeInsets.only(top:8.0),
                                  child: Text('Taken',style: kSubTitleStyle.copyWith(
                                      color: Colors.black54,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500
                                  ),),
                                )
                              ],
                            ),
                            StepsProgressBar(goal: goalSteps,current: stepsTaken,),
                            Column(
                              children: [
                                Text('${(goalSteps-stepsTaken)} steps',style: kSubTitleStyle.copyWith(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600
                                ),),
                                Padding(
                                  padding: const EdgeInsets.only(top:8.0),
                                  child: Text('Remaining',style: kSubTitleStyle.copyWith(
                                      color: Colors.black54,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500
                                  ),),
                                )
                              ],
                            )
                          ],
                        ),
                      ),


                    ],
                  ),
                ),
              ),



            ],
          ),
        ),),),
    );
  }
}
