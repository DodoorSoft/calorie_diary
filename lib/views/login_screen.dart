import 'package:calorie_diary/constants.dart';
import 'package:calorie_diary/controllers/sign_in_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool _isLoading = false;



  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      progressIndicator: const CircularProgressIndicator(color: kLightGreen,),
      inAsyncCall: _isLoading,
      child: Scaffold(
        backgroundColor: kLightBackground,
        body: SafeArea(
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Positioned(
                top: MediaQuery.of(context).size.height*.15,
                width: MediaQuery.of(context).size.width*.85,
                height: MediaQuery.of(context).size.height*.15,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text('Do not stop here',style: kTitleStyle,),
                    Text('Sign up so you can save your account and do not lose any of your progress',style: kSubTitleStyle,
                      textAlign: TextAlign.center,),
                  ],
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height*.35,
                width: MediaQuery.of(context).size.width*.85,
                height: MediaQuery.of(context).size.height*.25,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ListTile(
                      onTap: (){
                        setState((){
                          _isLoading = true;
                        });
                        SignInController.googleLogin(context).then((bool isSignedIn){
                          setState((){
                            _isLoading = false;
                          });
                          if(isSignedIn){
                            Navigator.of(context)
                                .pushNamedAndRemoveUntil('home_view', (Route<dynamic> route) => false);
                          }
                        });

                      },
                      leading: const FaIcon(FontAwesomeIcons.google,color: Colors.white,),
                      tileColor: kLightGreen,
                      title: const Text('Sign up with Google',style: kSubTitleStyle,),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)
                      ),

                    ),
                    ListTile(
                      onTap: (){},
                      leading: const FaIcon(FontAwesomeIcons.envelope,color: Colors.white,),
                      tileColor: kLightGreen,
                      title: const Text('Sign up with Mail',style: kSubTitleStyle),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)
                      ),

                    ),
                  ],
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height*.85,
                  child: const Text('By continuing you agree to our terms',style: kSubTitleStyle,))
            ]
          ),
        ),
      ),
    );
  }
}
