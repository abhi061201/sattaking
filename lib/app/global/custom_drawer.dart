import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:sattaking/app/History/view/History_view.dart';
import 'package:sattaking/app/Wallet/view/add_funds_view.dart';
import 'package:sattaking/app/Wallet/view/wallet_view.dart';
import 'package:sattaking/app/Wallet/view/withdraw_funds_view.dart';
import 'package:sattaking/app/all_game/view/all_games_view.dart';
import 'package:sattaking/app/global/colors.dart';
import 'package:sattaking/app/profile/view/profile_view.dart';

class custom_drawer extends StatelessWidget {
  custom_drawer({super.key});
  final padding = EdgeInsets.symmetric(horizontal: 15);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      
      width: Get.width * 0.75,
      shadowColor: Colors.grey,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border(
            left: BorderSide(
              color: appcolor().ambercolor,
            ),
            top: BorderSide(
              color: appcolor().ambercolor,
            ),
          ),
          // borderRadius: BorderRadius.circular(8),
        ),

        // padding: padding,
        child: ListView(
          children: [
            Container(
              height: Get.height * 0.13,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CircleAvatar(
                    radius: 25,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border(
                            // left: BorderSide(color: appcolor().ambercolor,),
                            // top: BorderSide(color: appcolor().ambercolor,),
                            ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name',
                        style: TextStyle(
                          color: appcolor().ambercolor,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '+91 9087849852',
                        style: TextStyle(
                            color: appcolor().ambercolor, fontSize: 16),
                      ),
                    ],
                  ).paddingOnly(
                    left: 10,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            drawerItemWidget(
              text: 'Home',
              iconData: Icons.home,
              callback: () {
                Get.back();
                Get.offAll(all_game_view());
              },
            ),
            drawerItemWidget(
              text: 'Update Profile',
              iconData: FontAwesomeIcons.addressBook,
              callback: () {
                Get.back();
                Get.to(profile_view());
              },
            ),
            drawerItemWidget(
              text: 'Add Fund',
              iconData: Icons.wallet,
              callback: () {
                Get.back();
                Get.to(add_funds_view());
              },
            ),
             drawerItemWidget(
              text: 'Withdraw Fund',
              iconData: Icons.wallet,
              callback: () {
                Get.back();
                Get.to(withdraw_funds_view());
              },
            ),
            drawerItemWidget(
              text: 'History',
              iconData: Icons.history,
              callback: () {
                Get.back();
                Get.to(History_view());
              },
            ),
            drawerItemWidget(
              text: 'How to play',
              iconData: Icons.video_camera_back,
              callback: () {},
            ),
            drawerItemWidget(
              text: 'App Rating',
              iconData: FontAwesomeIcons.star,
              callback: () {},
            ),
            drawerItemWidget(
              text: 'Share',
              iconData: Icons.share,
              callback: () {},
            ),
            drawerItemWidget(
              text: 'Contact Us',
              iconData: FontAwesomeIcons.phone,
              callback: () {},
            ),
            drawerItemWidget(
              text: 'Notifications',
              iconData: Icons.notifications,
              callback: () {},
            ),
            drawerItemWidget(
              text: 'Logout',
              iconData: Icons.logout,
              callback: () {},
            ),
          ],
        ),
      ),
    );
  }
}

Widget drawerItemWidget({
  required String text,
  required IconData iconData,
  required Callback callback,
  final hovercolor = Colors.white70,
}) {
  return InkWell(
    onTap: callback,
    child: Container(
      // margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
              height: Get.height * 0.025,
              child: Icon(
                iconData,
                color: appcolor().ambercolor,
                size: 25,
              )),
          SizedBox(
            width: Get.width * 0.05,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ],
      ),
    ),
  );
}
