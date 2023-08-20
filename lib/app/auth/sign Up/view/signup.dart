import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sattaking/app/auth/login/view/login.dart';
import 'package:sattaking/app/auth/sign%20Up/controller/sign%20up%20controller.dart';
import 'package:sattaking/app/global/colors.dart';

class signup_view extends StatelessWidget {
  signup_view({super.key});
  signUpController controller = Get.put(signUpController());
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/background 1.png',
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Container(
            width: Get.width,
            height: Get.height,
            decoration: BoxDecoration(color: Colors.transparent),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: Get.height * 0.18,
                  child: Image(
                    image: AssetImage(
                      'assets/images/logo 1.png',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                customfield('Name :', TextInputType.name, 30,
                    controller.emailcontroller),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                customfield('Email id :', TextInputType.emailAddress, 30,
                    controller.password_controller),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                customfield(
                  'Mobile Number :',
                  TextInputType.phone,
                  10,
                  controller.phone_no_Controller,
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                InkWell(
                  onTap: () {
                    controller.signUpUsingEmail_Password();
                  },
                  child: Container(
                    margin: EdgeInsets.all(
                      5,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        5,
                      ),
                      color: appcolor().ambercolor,
                    ),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget customfield(String hintText, TextInputType? keyType, int maxElement,
      TextEditingController tcontroller) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      width: Get.width * 0.8,
      height: Get.height * 0.065,
      child: TextFormField(
        controller: tcontroller,
        keyboardType: keyType,
        maxLength: maxElement,
        style: TextStyle(
          color: appcolor().ambercolor,
          fontSize: 18,
        ),
        decoration: InputDecoration(
          counter: Offstage(),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 15,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: appcolor().ambercolor,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
