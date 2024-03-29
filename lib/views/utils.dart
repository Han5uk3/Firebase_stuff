import 'package:flutter/material.dart';

final messengerKey = GlobalKey<ScaffoldMessengerState>();
class utils{
  static showSnackBar(String? text){
    if(text == null){
      return;
    }
    final snackBar = SnackBar(content: Text(text),backgroundColor: Colors.red,);
    messengerKey.currentState!
    ..removeCurrentSnackBar()
    ..showSnackBar(snackBar);
  }
}