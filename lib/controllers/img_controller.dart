// ignore_for_file: camel_case_types

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
class imgroller extends ChangeNotifier{
  List<File> pics = [];
  pickimg() async {
  var temp = await ImagePicker().pickMultiImage();
  var mylist = temp.map((e) => File(e.path)).toList();
  pics.addAll(mylist);
  notifyListeners();

}
}