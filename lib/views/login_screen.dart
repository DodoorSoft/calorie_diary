
import 'package:calorie_diary/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Center(
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: Colors.black,

            ),
            onPressed: ()async{
              UserController.googleLogin(context).whenComplete(() => Navigator.popAndPushNamed(context, 'home_screen'));
            },
            icon: const FaIcon(FontAwesomeIcons.google,color: Colors.red,),
            label: const Text('Sign Up with Google'),
          ),
        ),
      ),
    );
  }
}
