
import 'package:flutter/material.dart';

import '../class_models/user_model.dart';

class UserData extends ChangeNotifier{

  CustomUser? _user;

  CustomUser get user => _user!;

  void login(CustomUser user){
    _user = user;
    notifyListeners();
  }

}