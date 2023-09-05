import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sattaking/app/auth/login/view/login.dart';
import 'package:sattaking/app/auth/sign%20Up/controller/sign%20up%20controller.dart';
import 'package:sattaking/app/auth/sign%20Up/view/forgot_password_view.dart';
import 'package:sattaking/app/global/colors.dart';
import 'package:sattaking/app/profile/view/profile_view.dart';

class signup_view extends StatelessWidget {
  signup_view({super.key});
  signUpController controller = Get.put(signUpController());
  @override
  Widget build(BuildContext context) {
    controller.emailcontroller.clear();
    controller.nameController.clear();
    controller.phone_no_Controller.clear();
    controller.password_controller.clear();
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
        body: Container(
          width: Get.width,
          height: Get.height,
          decoration: BoxDecoration(color: Colors.transparent),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: Get.height * 0.15,
                ),
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
                    controller.nameController, Icons.person, false),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                customfield('Email id :', TextInputType.emailAddress, 30,
                    controller.emailcontroller, Icons.email, false),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                customfield('Mobile Number :', TextInputType.phone, 10,
                    controller.phone_no_Controller, Icons.call, false),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                Obx(
                  () => Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: appcolor().ambercolor,
                      ),
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black,
                    ),
                    width: Get.width * 0.8,
                    height: Get.height * 0.065,
                    child: Row(
                      children: [
                        Flexible(
                          child: TextFormField(
                            obscureText: !controller.showPassword.value,
                            controller: controller.password_controller,
                            keyboardType: TextInputType.visiblePassword,
                            maxLength: 20,
                            style: TextStyle(
                              color: appcolor().ambercolor,
                              fontSize: 18,
                            ),
                            textAlignVertical: TextAlignVertical.top,
                            decoration: InputDecoration(
                              counter: Offstage(),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 0),
                              hintText: 'Password :',
                              hintStyle: TextStyle(
                                color: appcolor().ambercolor,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            controller.showPassword.value =
                                !controller.showPassword.value;
                            // log(controller.showPassword.value.toString());
                            // log('hii');
                          },
                          child: Icon(
                            controller.showPassword.value == false
                                ? Icons.lock
                                : Icons.lock_open,
                            color: appcolor().ambercolor,
                          ).paddingOnly(
                            right: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                Obx(
                  () => controller.showCircle.value == false
                      ? InkWell(
                          onTap: () async {
                            // DocumentSnapshot? snapshot =
                            //     await FirebaseFirestore.instance
                            //         .collection('Users')
                            //         .doc(
                            //           controller.phone_no_Controller.text
                            //               .trim()
                            //               .toString(),
                            //         )
                            //         .get();
                            // if(snapshot==null)
                            // {
                              
                            // }
                            controller.signUpUsingEmail_Password();
                            
                            // Get.to(profile_view());
                          },
                          child: Container(
                            margin: EdgeInsets.all(
                              5,
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                5,
                              ),
                              color: appcolor().ambercolor,
                            ),
                            child: Text(
                              'Register Now',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        )
                      : CircularProgressIndicator(
                          color: appcolor().ambercolor,
                        ),
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already Registered?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.offAll(() => login_view());
                      },
                      child: Text(
                        'Login Now',
                        style: TextStyle(
                          color: appcolor().ambercolor,
                          fontSize: 16,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.08,
                ),
                Text(
                  'Contact Us',
                  style: TextStyle(
                    color: appcolor().ambercolor,
                    fontSize: 18,
                  ),
                ),
                Divider(
                  color: appcolor().ambercolor,
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.call,
                          color: appcolor().ambercolor,
                        ),
                        Text(
                          '+91 12345 56787',
                          style: TextStyle(
                            color: appcolor().ambercolor,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.whatsapp,
                          color: Colors.green,
                        ),
                        Text(
                          '+91 12345 56787',
                          style: TextStyle(
                            color: appcolor().ambercolor,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ).paddingSymmetric(horizontal: 20),
          ),
        ),
      ),
    );
  }

  Widget customfield(String hintText, TextInputType? keyType, int maxElement,
      TextEditingController textcontroller, IconData icon, bool showelement) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: appcolor().ambercolor,
        ),
        borderRadius: BorderRadius.circular(5),
        color: Colors.black,
      ),
      width: Get.width * 0.8,
      height: Get.height * 0.065,
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              obscureText: false,
              controller: textcontroller,
              keyboardType: keyType,
              maxLength: maxElement,
              style: TextStyle(
                color: appcolor().ambercolor,
                fontSize: 18,
              ),
              textAlignVertical: TextAlignVertical.top,
              decoration: InputDecoration(
                counter: Offstage(),
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                hintText: hintText,
                hintStyle: TextStyle(
                  color: appcolor().ambercolor,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Icon(
              icon,
              color: appcolor().ambercolor,
            ).paddingOnly(
              right: 10,
            ),
          )
        ],
      ),
    );
  }
}
