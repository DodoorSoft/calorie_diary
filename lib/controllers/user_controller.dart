import 'package:calorie_diary/providers/sign_in_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/class_data/user_data.dart';
import '../models/class_models/user_model.dart';



class UserController{



  static CustomUser getUser(BuildContext context){
    return Provider.of<UserData>(context,listen: false).user;
  }

  static void setInitialUserInfo(BuildContext context,String name,int weight,int height,DateTime birthday,int gender){
    return Provider.of<UserData>(context,listen: false).setInitialUserInfo(
        name,
        weight,
        height,
        birthday,
        gender
    );
  }

  static Map<String,dynamic> toJSON(BuildContext context){
    return Provider.of<UserData>(context,listen: false).toJSON();
  }


}