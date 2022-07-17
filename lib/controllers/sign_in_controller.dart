
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/class_data/user_data.dart';
import '../models/class_models/user_model.dart';
import '../providers/sign_in_provider.dart';

class SignInController{

  static Future<bool> googleLogin(BuildContext context)async{
    CustomUser user = await SignInProvider().googleLogin();
    Provider.of<UserData>(context,listen:false).finalLogin(user);
    return user.isSignedIn;

  }

}