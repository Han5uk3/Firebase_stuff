// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';

class countroller extends ChangeNotifier{
  int count = 0;
  void increment(){
    count++;
    notifyListeners();
}
  void decrement(){
    count--;
    notifyListeners();
  }
}