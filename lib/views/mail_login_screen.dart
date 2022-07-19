import 'package:calorie_diary/components/custom_button.dart';
import 'package:calorie_diary/components/custom_text_field.dart';
import 'package:calorie_diary/constants.dart';
import 'package:flutter/material.dart';


class MailLoginScreen extends StatefulWidget {
  const MailLoginScreen({Key? key}) : super(key: key);

  @override
  State<MailLoginScreen> createState() => _MailLoginScreenState();
}

class _MailLoginScreenState extends State<MailLoginScreen> {

  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _mailNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _mailController.addListener(() {
      setState((){});
    });
    _passwordController.addListener(() {
      setState((){});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _passwordController.dispose();
    _mailController.dispose();
    _mailNode.dispose();
    _passwordNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Positioned(
                top: MediaQuery.of(context).size.height*.1,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomTextField(controller: _mailController, node: _mailNode, keyboardType: TextInputType.emailAddress,
                      text: 'Email',hintTextDirection: TextDirection.rtl,hintTextAlign: TextAlign.start,padding:const EdgeInsets.only(left: 50,right: 50,top: 30,bottom: 30),),
                    CustomTextField(controller: _passwordController, node: _passwordNode, keyboardType: TextInputType.text,
                      text: 'Password',isObscure: true,hintTextDirection: TextDirection.rtl,hintTextAlign: TextAlign.start,padding:const EdgeInsets.only(left: 50,right: 50,top: 30,bottom: 40),),
                    CustomButton(color: kLightGreen, onPressed: (){}, buttonChild: Text('Sign Up',style: kSubTitleStyle.copyWith(color: Colors.white),))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
