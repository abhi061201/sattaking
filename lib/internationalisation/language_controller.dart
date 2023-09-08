import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Applanguagecontroller extends GetxController{

  RxString groupValue = 'English'.obs;

  void changeLanguage(var p1, var p2){
    Get.back();
    Get.updateLocale(Locale(p1,p2));
  }
}