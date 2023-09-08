import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:sattaking/app/Wallet/controller/add_fund_controller.dart';
import 'package:sattaking/app/global/colors.dart';
import 'package:sattaking/app/global/contactUs_Widget.dart';
import 'package:sattaking/app/global/custom_drawer.dart';

class add_funds_view extends StatelessWidget {
  add_funds_view({super.key});
  add_fund_controller controller = Get.put(add_fund_controller());
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
                          'Add Funds'.tr,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: appcolor().ambercolor,
                          ),
                          color: Colors.black,
                        ),
                        // width: Get.width * 0.8,
                        height: Get.height * 0.065,
                        child: Row(
                          children: [
                            Flexible(
                              child: TextFormField(
                                controller: controller.fund_controller,
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                                textAlignVertical: TextAlignVertical.top,
                                decoration: InputDecoration(
                                  counter: Offstage(),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 0),
                                  hintText: 'Add Funds'.tr,
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            Icon(
                              FontAwesomeIcons.indianRupeeSign,
                              color: appcolor().ambercolor,
                            ).paddingOnly(
                              right: 10,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.03,
                      ),
                      Container(
                        child: Text(
                          'Select Payment Mthods'.tr,
                          style: TextStyle(
                            color: appcolor().ambercolor,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          custom_container('assets/images/paytm.png', () {}),
                          custom_container(
                              'assets/images/PhonePe-Logo.png', () {}),
                        ],
                      ),
                      custom_container(
                          'assets/images/Google_Pay_Logo 1.png', () {}),
                      SizedBox(
                        height: Get.height * 0.23,
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

  Widget custom_container(
    String image_path,
    Callback callback,
  ) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: Get.width * 0.3,
        height: Get.height * 0.06,
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.black,
          border: Border.all(
            color: appcolor().ambercolor,
          ),
        ),
        child: Image(
          image: AssetImage(image_path),
        ),
      ),
    );
  }
}
