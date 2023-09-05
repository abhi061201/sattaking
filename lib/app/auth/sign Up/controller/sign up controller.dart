import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sattaking/app/all_game/view/all_games_view.dart';
import 'package:sattaking/app/auth/login/view/login.dart';
import 'package:sattaking/app/global/firebase_helper.dart';
import 'package:sattaking/app/global/model/user_model.dart';

class signUpController extends GetxController {
  RxBool showCircle = false.obs;
  RxBool showPassword = false.obs;

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  TextEditingController phone_no_Controller = TextEditingController();
  TextEditingController nameController = TextEditingController();

  void signUpUsingEmail_Password() async {
    showCircle.value = true;
    String email = phone_no_Controller.text.trim().toString() + '@gmail.com';
    String useremail = emailcontroller.text.trim().toString();
    String password = password_controller.text.trim().toString();
    String phone_number = phone_no_Controller.text.trim().toString();
    String username = nameController.text.trim().toString();

    if (email == '' || password == '') {
      log('please enter some value');
      showCircle.value = false;
      return;
    } else if (check(phone_number)) {
      Get.snackbar('Error', 'Issue in phone no',
          snackPosition: SnackPosition.TOP);
      showCircle.value = false;
      return ;
    }
    UserCredential? credential;
    try {
      // log(email);
      // log(password);
      // log(phone_number);
      DocumentSnapshot? snapshot = await FirebaseFirestore.instance
          .collection('Users')
          .doc(phone_number)
          .get();

      if (snapshot.data() == null) {
        credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: useremail,
          password: password,
        );
        if (credential != null) {
          String uid = credential.user!.uid;
          log(username +
              " : " +
              phone_number +
              " : " +
              password +
              " : " +
              uid +
              " : " +
              username);

          UserModel newuser = UserModel(
            email: useremail,
            mobile_no: phone_number,
            // password: password,
            userid: uid,
            username: username,
          );
          firebase_helper.setUserData(newuser);

          log('user data set success');
          password_controller.clear();
          phone_no_Controller.clear();
          Get.snackbar('Success', 'User Account created please login');
          Get.offAll(login_view());
        }
      } else {
        Get.snackbar('Error', 'Phone number already registered please login');
      }
    }
    // on FirebaseAuthException catch (e) {
    //   password_controller.clear();
    //   phone_no_Controller.clear();
    //   showCircle.value = false;
    //   if (e.code == 'weak-password') {
    //     log('The password provided is too weak.');
    //   } else if (e.code == 'email-already-in-use') {
    //     log('The account already exists for that email.');
    //   }
    // }
    catch (e) {
      showCircle.value = false;
      // log(e.toString());
      Get.snackbar('Error', e.toString());
    }
    showCircle.value = false;
    password_controller.clear();
    phone_no_Controller.clear();
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
