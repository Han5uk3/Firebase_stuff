// ignore_for_file: camel_case_types

import 'package:get/get.dart';

class control extends GetxController{
  RxInt count = 0.obs;
  void increment(){
    count++;
  }

}