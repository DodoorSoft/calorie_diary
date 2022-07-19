
import 'package:flutter/material.dart';

import '../class_models/user_model.dart';

class UserData extends ChangeNotifier{

  CustomUser _user = CustomUser();

  CustomUser get user => _user;

  void login(CustomUser user){
    _user = user;
    notifyListeners();
  }

  void setInitialUserInfo(String name, double weight, int height,DateTime birthday,int gender){
    _user.displayName = name;
    _user.currentWeightInKg = weight;
    _user.heightInCm = height;
    _user.birthday = birthday;
    _user.gender = gender;
    notifyListeners();
  }

  void finalLogin(CustomUser user){
    _user.photoUrl = user.photoUrl;
    _user.email = user.email;
    _user.isSignedIn = user.isSignedIn;
    notifyListeners();

  }

  Map<String,dynamic> toJSON(){
    return _user.toJSON();
}

}