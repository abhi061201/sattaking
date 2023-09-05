import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sattaking/app/all_game/view/all_games_view.dart';
import 'package:sattaking/app/global/firebase_helper.dart';
import 'package:sattaking/app/global/model/user_model.dart';
import 'package:sattaking/app/home/view/home_view.dart';

class loginController extends GetxController {
  TextEditingController mobilecontroller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  RxBool show_Circle = false.obs;
  Future<void> FirebaseLogin(String MobileNumber, String Password) async {
    show_Circle.value = true;
    if (MobileNumber.length != 10) {
      Get.snackbar('Error', 'Please Input correct Mobile Number',
          snackPosition: SnackPosition.TOP);
      show_Circle.value = false;
    } else if (check(MobileNumber)) {
      Get.snackbar('Error', 'Issue in phone no',
          snackPosition: SnackPosition.TOP);
      // showcircle.value = false;
      show_Circle.value = false;
    } else if (Password.length < 6) {
      Get.snackbar('Error', 'Password should contain atleast 6 characters',
          snackPosition: SnackPosition.TOP);
      show_Circle.value = false;
    } else {
      FirebaseAuth _auth = await FirebaseAuth.instance;
      UserCredential? credential;
      String mobile_no = MobileNumber.trim().toString();
      String password = Password.trim().toString();
      log(mobile_no);
      log(password);
      try {
        UserModel? userModel = await firebase_helper.getUserModel(mobile_no);
        if (userModel != null) {
          credential = await _auth.signInWithEmailAndPassword(
              email: userModel.email!, password: password);

          Get.offAll(all_game_view());
          password_controller.clear();
          mobilecontroller.clear();
          show_Circle.value = false;
        }
      } catch (e) {
        show_Circle.value = false;
        Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.TOP);
        password_controller.clear();
        mobilecontroller.clear();
      }
    }
  }

  bool check(String phone) {
    // log('hii');
    var char = phone[0];
    if (char == '6' || char == '7' || char == '8' || char == '9') {
      return false;
    }
    log(char);
    return true;
  }
}
