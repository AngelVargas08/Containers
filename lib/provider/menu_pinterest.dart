
import 'package:flutter/Material.dart';

class SelectItemMenu extends ChangeNotifier{

  late int _select = 0;
  int get selectItemMenu => _select; 
  set selectItemMenu(int i){
     _select = i;
     notifyListeners();
  }


  bool _mostrar = false;
  bool get mostrar =>_mostrar;
  set mostrar(bool i){
    _mostrar = i;
    notifyListeners();
  }
  
}