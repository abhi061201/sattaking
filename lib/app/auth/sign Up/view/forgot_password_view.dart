import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sattaking/app/all_game/view/all_games_view.dart';
import 'package:sattaking/app/auth/login/view/login.dart';
import 'package:sattaking/app/auth/sign%20Up/controller/forgot_password_controller.dart';
import 'package:sattaking/app/auth/sign%20Up/controller/sign%20up%20controller.dart';
import 'package:sattaking/app/global/colors.dart';

class forgot_Password_view extends StatelessWidget {
  forgot_Password_view({super.key});
  forgot_password_controller forgot_controller =
      Get.put(forgot_password_controller());
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
                customfield('Mobile Number :', TextInputType.phone, 10,
                    forgot_controller.phone_controller, Icons.call),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //                       ],
                // ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                // Obx(
                //   () => forgot_controller.showcircle.value == false
                //       ? TextButton(
                //           onPressed: () {
                //             forgot_controller.resetUserPassword();
                //           },
                //           style: TextButton.styleFrom(
                //               // padding: EdgeInsets.zero,
                //               tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                //           child: Text(
                //             'Send Email',
                //             style: TextStyle(
                //               color: appcolor().ambercolor,
                //               fontSize: 15,
                //             ),
                //           ),
                //         ).paddingOnly(right: 10)
                //       : CircularProgressIndicator(
                //           color: appcolor().ambercolor,
                //         ),
                // ),

                // SizedBox(
                //   height: Get.height * 0.007,
                // ),
                Obx(
                  () => forgot_controller.showcircle.value == false
                      ? InkWell(
                          onTap: () {
                            // controller.signUpUsingEmail_Password();
                            // Get.offAll(login_view());
                            forgot_controller.resetUserPassword();
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
                              'Send Email',
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
                  height: Get.height * 0.4,
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
      TextEditingController controller, IconData icon) {
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
              controller: controller,
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
          Icon(
            icon,
            color: appcolor().ambercolor,
          ).paddingOnly(
            right: 10,
          )
        ],
      ),
    );
  }
}
