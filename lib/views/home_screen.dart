import 'package:calorie_diary/components/top_calendar.dart';
import 'package:calorie_diary/constants.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

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
          SleekCircularSlider(
            initialValue: 1200,
              min: 0,
              max: 99999,
              appearance: CircularSliderAppearance(
                spinnerMode: true
              ),
              onChange: (double value) {
                print(value);
              })
            ],
          ),
        ),),),
    );
  }
}
