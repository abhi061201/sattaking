import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class signUpController extends GetxController {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  TextEditingController phone_no_Controller = TextEditingController();
  TextEditingController otpController = TextEditingController();

  void signUpUsingEmail_Password() async {
    String email = password_controller.text.trim().toString();
    String password = phone_no_Controller.text.trim().toString();
    String phone_number = phone_no_Controller.text.trim().toString();

    if (email == '' || password == '') {
      log('please enter some value');
      return;
    }
    UserCredential? credential;
    try {
      credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
      }
    } catch (e) {
      log(e.toString());
    }
    log('User created successfully');
  }
}
