import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sattaking/app/global/firebase_helper.dart';
import 'package:sattaking/app/global/model/user_model.dart';

class forgot_password_controller extends GetxController {
  RxBool showcircle = false.obs;
  TextEditingController phone_controller = TextEditingController();

  Future<void> resetUserPassword() async {
    showcircle.value = true;
    String phone = phone_controller.text.trim().toString();
    if (phone.length != 10) {
      Get.snackbar('Error', 'Check your phone no',
          snackPosition: SnackPosition.TOP);
      showcircle.value = false;
    } else if (check(phone)) {
      Get.snackbar('Error', 'Issue in phone no',
          snackPosition: SnackPosition.TOP);
      showcircle.value = false;
    } else {
      print('out the house');
      try {
        UserModel? usermodel;
        usermodel = await firebase_helper.getUserModel(phone);
        if (usermodel != null) {
          await firebase_helper.resetPassword(usermodel);
          Get.snackbar('Success', 'Check your email and go back to login',
              snackPosition: SnackPosition.TOP);
          showcircle.value = false;
        } else {
          phone_controller.clear();
          log('user model empty');
          Get.snackbar('Error', 'No user found',
              snackPosition: SnackPosition.TOP);
          showcircle.value = false;
        }
      } catch (e) {
        showcircle.value = false;
        log(e.toString());
      }
    }
    phone_controller.clear();
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
