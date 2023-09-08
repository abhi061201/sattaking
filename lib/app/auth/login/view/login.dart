import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sattaking/app/all_game/view/all_games_view.dart';
import 'package:sattaking/app/auth/login/controller/login_controller.dart';
import 'package:sattaking/app/auth/sign%20Up/view/forgot_password_view.dart';
import 'package:sattaking/app/auth/sign%20Up/view/signup.dart';
import 'package:sattaking/app/game/view/game_view.dart';
import 'package:sattaking/app/global/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sattaking/app/global/contactUs_Widget.dart';
import 'package:sattaking/app/notifications/notification.dart';
import 'package:sattaking/internationalisation/language_controller.dart';

class login_view extends StatefulWidget {
  const login_view({super.key});

  @override
  State<login_view> createState() => _login_viewState();
}

class _login_viewState extends State<login_view> {
  NotificationServices services = NotificationServices();
  loginController controller = Get.put(loginController());
  Applanguagecontroller language_controller = Get.put(Applanguagecontroller());

  @override
  void initState() {
    // TODO: implement initState
    // services.requestNotificationPermission();
    // services.firebaseInit();
    // services.getDeviceToken().then((value) {
    //   print('device token: ' + value.toString());
    // } );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controller.mobilecontroller.clear();
    controller.password_controller.clear();
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/background 1.png',
          ),
          fit: BoxFit.fill,
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
                  height: Get.height * 0.08,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.bottomSheet(Wrap(
                          children: [
                            Row(
                              children: [
                                Text('English'),
                                Spacer(),
                                Radio(
                                  value: '',
                                  groupValue: '',
                                  onChanged: (val) {},
                                ),
                              ],
                            ),
                          ],
                        ));
                      },
                      child: Container(
                        margin: EdgeInsets.all(
                          5,
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            5,
                          ),
                          color: appcolor().ambercolor,
                        ),
                        child: Text(
                          'Translate',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: Get.height * 0.12,
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
                customfield('Mobile Number'.tr, TextInputType.phone, 10,
                    Icons.call, controller.mobilecontroller, false),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                customfield('Password'.tr, TextInputType.visiblePassword, 20,
                    Icons.lock, controller.password_controller, true),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.to(forgot_Password_view());
                      },
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size(50, 30),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          alignment: Alignment.centerLeft),
                      child: Text(
                        'Forgot Password'.tr + '?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ).paddingSymmetric(horizontal: 12),
                Obx(
                  () => controller.show_Circle.value == false
                      ? InkWell(
                          onTap: () {
                            String mobile_no = controller.mobilecontroller.text
                                .trim()
                                .toString();
                            String password = controller
                                .password_controller.text
                                .trim()
                                .toString();

                            controller.FirebaseLogin(mobile_no, password);
                            // Get.to(all_game_view());
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
                              'Login',
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
                      'Not a Member?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.offAll(() => signup_view());
                      },
                      child: Text(
                        'Register Now',
                        style: TextStyle(
                          color: appcolor().ambercolor,
                          fontSize: 16,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.1,
                ),
                contactUs_Widget(),
                // Text(
                //   'Contact Us',
                //   style: TextStyle(
                //     color: appcolor().ambercolor,
                //     fontSize: 18,
                //   ),
                // ),
                // Divider(
                //   color: appcolor().ambercolor,
                //   thickness: 1,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     Row(
                //       children: [
                //         Icon(
                //           Icons.call,
                //           color: appcolor().ambercolor,
                //         ),
                //         Text(
                //           '+91 12345 56787',
                //           style: TextStyle(
                //             color: appcolor().ambercolor,
                //             fontSize: 16,
                //           ),
                //         ),
                //       ],
                //     ),
                //     Row(
                //       children: [
                //         Icon(
                //           FontAwesomeIcons.whatsapp,
                //           color: Colors.green,
                //         ),
                //         Text(
                //           '+91 12345 56787',
                //           style: TextStyle(
                //             color: appcolor().ambercolor,
                //             fontSize: 16,
                //           ),
                //         ),
                //       ],
                //     ),
                //   ],
                // ),
              ],
            ).paddingSymmetric(
              horizontal: 20,
            ),
          ),
        ),
      ),
    );
  }

  Widget customfield(String hintText, TextInputType? keyType, int maxElement,
      IconData icon, TextEditingController textcontroller, bool showelement) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: appcolor().ambercolor,
        ),
        color: Colors.black,
      ),
      width: Get.width * 0.8,
      height: Get.height * 0.065,
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              obscureText: showelement,
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

  Widget custombottomsheet(BuildContext context) {
    return BottomSheet(
        onClosing: () {},
        builder: (context) {
          return Container();
        });
  }
}
