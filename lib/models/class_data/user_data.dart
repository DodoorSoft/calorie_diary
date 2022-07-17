
import 'package:flutter/material.dart';

import '../class_models/user_model.dart';

class UserData extends ChangeNotifier{

  CustomUser _user = CustomUser();

  CustomUser get user => _user;

  void login(CustomUser user){
    _user = user;
    notifyListeners();
  }

  void setInitialUserInfo(String name, int weight, int height,DateTime birthday,int gender){
    _user.displayName = name;
    _user.currentWeightInKg = weight;
    _user.currentHeightInCm = height;
    _user.birthday = birthday;
    _user.gender = gender;
    notifyListeners();

  }

}