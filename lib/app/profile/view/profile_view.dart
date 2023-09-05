import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:sattaking/app/global/colors.dart';
import 'package:sattaking/app/global/firebase_helper.dart';
import 'package:sattaking/app/profile/view/edit_profile_view.dart';

class profile_view extends StatelessWidget {
  profile_view({super.key});

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
                      ],
                    ),
                  ),
                ),
                SliverList.list(
                  children: [
                    SizedBox(height: Get.height * 0.07),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          child: Icon(Icons.person, size: 50,),
                          radius: 50,
                        ),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        customContainer('Profile', Icons.person,(){
                          Get.off(edit_profile_view());
                        } ),
                        customContainer('Payment', FontAwesomeIcons.paypal,(){}),
                        customContainer('AppStore', FontAwesomeIcons.appStore,(){}),
                        customContainer('Rating', Icons.rate_review,(){}),
                        customContainer('Website Link', Icons.link,(){}),
                        customContainer('Change Password', Icons.person,(){}),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                firebase_helper.firebase_logout();
                              },
                              child: Container(
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
                                  'Logout',
                                  style: TextStyle(
                                    color: appcolor().ambercolor,
                                  ),
                                ),
                              ),
                            ),
                          ],
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

  Widget customContainer(String title, IconData icondata, Callback callback) {
    return InkWell(
      onTap: callback,
      child: Container(
        width: Get.width,
        margin: EdgeInsets.only(bottom: 8),
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
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
            Text(
              '${title}',
              style: TextStyle(
                color: appcolor().ambercolor,
                fontSize: 15,
              ),
            ),
            Icon(
              icondata,
              color: appcolor().ambercolor,
            )
          ],
        ),
      ),
    );
  }
}
