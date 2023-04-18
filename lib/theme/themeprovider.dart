


import 'package:flutter/material.dart';

class ThemePri extends ChangeNotifier{

bool _darkmode  = false;
bool _customMode = false;
ThemeData _curretTheme = ThemeData.light();

bool get darkmode => _darkmode;
bool get customMode => _customMode;
ThemeData get curretTheme => _curretTheme;

set darkmode (bool i){
  _darkmode = i; 
  _customMode = false;

  if(i){
    _curretTheme = ThemeData.dark();
  }else{
    _curretTheme = ThemeData.light();
  }

    notifyListeners();
}


set customMode (bool i){
  _customMode = i; 
  _darkmode = false;
  notifyListeners();
}

}