import 'package:calorie_diary/views/get_started_screen.dart';
import 'package:calorie_diary/views/home_screen.dart';
import 'package:calorie_diary/views/landing_screen.dart';
import 'package:calorie_diary/views/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:calorie_diary/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/class_data/user_data.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserData>(create: (context)=>UserData())
      ],
      child: MaterialApp(
        routes: {
          'home_view':(context)=> HomeView(),
          'login_screen': (context) => const LoginScreen()
        },
        home: const GetStartedScreen()
      ),
    );
  }
}
