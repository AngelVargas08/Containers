

import 'package:flutter/Material.dart';

class SliderModel extends ChangeNotifier{

    double _curretpage = 0;
    double get curretpage => _curretpage;
    
    set curretpage(double page){
        _curretpage = page;
        notifyListeners();
    }

}