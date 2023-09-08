import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sattaking/app/History/controller/win_history_controller.dart';
import 'package:sattaking/app/global/colors.dart';
import 'package:sattaking/app/global/contactUs_Widget.dart';
import 'package:sattaking/app/global/custom_drawer.dart';

class Win_History_view extends StatelessWidget {
  Win_History_view({super.key});
  win_history_controller controller = Get.put(win_history_controller());
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
          endDrawer: custom_drawer(),
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.transparent,
                  expandedHeight: Get.height * 0.09,
                  // snap: true,
                  floating: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image(
                          image: AssetImage(
                            'assets/images/logo 1.png',
                          ),
                          height: Get.height * 0.08,
                        ),
                        // InkWell(
                        //   onTap: (){
                        //     urlController.LaunchUrl();
                        //   },
                        //   child: Container(
                        //     height: Get.height*0.08,
                        //     width: Get.width*0.27,
                        //     decoration: BoxDecoration(
                        //       image: DecorationImage(
                        //         image: AssetImage('assets/images/674 1.png'),
                        //         fit: BoxFit.fill,
                        //       )
                        //     ),
                        //   ),
                        // ),
                        // InkWell(
                        //   onTap: () {
                        //     Get.off(profile_view());
                        //   },
                        //   child: Icon(Icons.more_horiz_outlined, color: appcolor().am,)
                        // ),
                      ],
                    ),
                  ),
                ),
                SliverList.list(children: [
                  SizedBox(
                    height: Get.height * 0.2,
                  ),
                  Column(
                    children: [
                      Container(
                        child: Text(
                          'Win History'.tr,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          controller.showdatepickerstart(context);
                        },
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 4),
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black,
                            border: Border.all(
                              color: appcolor().ambercolor,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Obx(
                                () => controller.startdate.value == ''
                                    ? Text(
                                        'Start Date'.tr,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      )
                                    : Text(
                                        '${controller.startdate.value}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                              ),
                              Icon(
                                Icons.date_range,
                                color: appcolor().ambercolor,
                              )
                            ],
                          ).paddingSymmetric(
                            horizontal: 15,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          controller.showdatepickerend(context);
                        },
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 4),
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black,
                            border: Border.all(
                              color: appcolor().ambercolor,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Obx(
                                () => controller.enddate.value == ''
                                    ? Text(
                                        'End Date'.tr,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      )
                                    : Text(
                                        '${controller.enddate.value}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                              ),
                              Icon(
                                Icons.date_range,
                                color: appcolor().ambercolor,
                              )
                            ],
                          ).paddingSymmetric(
                            horizontal: 15,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
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
                            'Submit'.tr,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.3,
                      ),
                      contactUs_Widget(),
                    ],
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
