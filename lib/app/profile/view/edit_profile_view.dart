import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:sattaking/app/ImagePicker/imagePicker.dart';
import 'package:sattaking/app/all_game/view/all_games_view.dart';
import 'package:sattaking/app/global/colors.dart';

class edit_profile_view extends StatelessWidget {
  edit_profile_view({super.key});
  ImagePickerController imagecontroller = Get.put(ImagePickerController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
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
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            child: CustomScrollView(
              slivers: [
                SliverList.list(
                  children: [
                    SizedBox(height: Get.height * 0.15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage(
                            'assets/images/logo 1.png',
                          ),
                          height: Get.height * 0.15,
                        ),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        customfield('Edit Name', TextInputType.name, 30,
                            TextEditingController(), Icons.person),
                        customfield(
                          'Edit Email',
                          TextInputType.emailAddress,
                          30,
                          TextEditingController(),
                          Icons.email,
                        ),
                        customfield(
                          'Edit Phone No.',
                          TextInputType.phone,
                          30,
                          TextEditingController(),
                          Icons.call,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 15,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: appcolor().ambercolor,
                            ),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Change Image :',
                                style: TextStyle(
                                  color: appcolor().ambercolor,
                                  fontSize: 13,
                                ),
                              ),
                              SizedBox(
                                width: Get.width * 0.04,
                              ),
                              Column(
                                children: [
                                  Obx(
                                    () {
                                      return imagecontroller.image_path.value ==
                                              ''
                                          ? CircleAvatar(
                                              radius: 40,
                                              child: Icon(
                                                Icons.person,
                                                size: 30,
                                              ),
                                            )
                                          : CircleAvatar(
                                              radius: 40,
                                              backgroundImage: FileImage(
                                                File(
                                                  imagecontroller
                                                      .image_path.value!
                                                      .toString(),
                                                ),
                                              ),
                                            );
                                    },
                                  ),
                                  InkWell(
                                    onTap: () {
                                      imagecontroller.reset();
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(top: 10),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 5,
                                      ),
                                      decoration: BoxDecoration(
                                          color: appcolor().ambercolor,
                                          border: Border.all(
                                            color: appcolor().ambercolor,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Text(
                                        'Remove Image',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  imagecontroller.getImagefromGallery();
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 5,
                                  ),
                                  decoration: BoxDecoration(
                                      color: appcolor().ambercolor,
                                      border: Border.all(
                                        color: appcolor().ambercolor,
                                      ),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text(
                                    'Edit Image',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.offAll(all_game_view());
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 10),
                            padding: EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.black,
                                border: Border.all(
                                  color: appcolor().ambercolor,
                                ),
                                borderRadius: BorderRadius.circular(8)),
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.1,
                        ),
                        Text(
                          'Helpline No: +91 12345 56787',
                          style: TextStyle(
                            color: appcolor().ambercolor,
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget customContainer(String title, IconData icondata, Callback callback) {
  //   return InkWell(
  //     onTap: callback,
  //     child: Container(
  //       width: Get.width,
  //       margin: EdgeInsets.only(bottom: 8),
  //       padding: EdgeInsets.symmetric(
  //         vertical: 10,
  //         horizontal: 20,
  //       ),
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(10),
  //         color: Colors.black,
  //         border: Border.all(
  //           color: appcolor().ambercolor,
  //         ),
  //       ),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           Text(
  //             '${title}',
  //             style: TextStyle(
  //               color: appcolor().ambercolor,
  //               fontSize: 15,
  //             ),
  //           ),
  //           Icon(
  //             icondata,
  //             color: appcolor().ambercolor,
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }
  Widget customfield(String hintText, TextInputType? keyType, int maxElement,
      TextEditingController controller, IconData icon) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: appcolor().ambercolor,
        ),
        borderRadius: BorderRadius.circular(5),
        color: Colors.black,
      ),
      // width: Get.width * 0.8,
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
