import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sattaking/app/global/colors.dart';

class game_view extends StatelessWidget {
   game_view({super.key});
  String gamelist='GameList'.tr;
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
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image(
                      image: AssetImage(
                        'assets/images/logo 1.png',
                      ),
                      height: Get.height * 0.08,
                    ),
                    Text(
                      '{$gamelist} \nFARIDABAD',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                // 1-10
                customContainer([1]),
                belowContainer(11, 200),
                SizedBox(height: Get.height*0.02,),
                // 1-10
                customContainer([11]),
                belowContainer(11, 200),
                SizedBox(height: Get.height*0.02,),
                // 1-10
                customContainer([21]),
                belowContainer(11, 200),
                SizedBox(height: Get.height*0.02,),
                // 1-10
                customContainer([31]),
                belowContainer(11, 200),
                SizedBox(height: Get.height*0.02,),
                // 1-10
                customContainer([41]),
                belowContainer(11, 200),
                SizedBox(height: Get.height*0.02,),
                // 1-10
                customContainer([51]),
                belowContainer(11, 200),
                SizedBox(height: Get.height*0.02,),
                // 1-10
                customContainer([61]),
                belowContainer(11, 200),
                SizedBox(height: Get.height*0.02,),
                // 1-10
                customContainer([71]),
                belowContainer(11, 200),
                SizedBox(height: Get.height*0.02,),
                // 1-10
                customContainer([81]),
                belowContainer(11, 200),
                SizedBox(height: Get.height*0.02,),
                // 1-10
                customContainer([91]),
                belowContainer(11, 200),
                SizedBox(height: Get.height*0.02,),
              ],
            ).paddingSymmetric(
              horizontal: 10,
              vertical: 5,
            ),
          ),
        ),
      ),
    );
  }

  Widget customContainer(List<int> list) {
    return Container(
      width: Get.width,
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (int i = list[0]; i < list[0] + 10; i++)
            Text(
              i.toString(),
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            )
        ],
      ),
    );
  }

  Widget belowContainer(int initial, int final_val) {
    return Container(
      margin: EdgeInsets.only(top: 2,),
      padding: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: appcolor().ambercolor,
      ),
      child: Text(
        '${initial}-${final_val}',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
