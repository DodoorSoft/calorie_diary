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
    return const Scaffold(
      backgroundColor: kLightBackground,
      body:
      SafeArea(child:
        Padding(padding: EdgeInsets.all(15),
        ),),
    );
  }
}
