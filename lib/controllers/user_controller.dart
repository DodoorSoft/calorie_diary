

import 'package:calorie_diary/providers/sign_in_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/class_data/user_data.dart';
import '../models/class_models/user_model.dart';

class UserController{

  static Future<bool> googleLogin(BuildContext context)async{
    CustomUser user = await SignInProvider().googleLogin();
    Provider.of<UserData>(context,listen:false).login(user);
    return user.isSignedIn;

  }

  static CustomUser getUser(BuildContext context){
    return Provider.of<UserData>(context,listen: false).user;
  }


}