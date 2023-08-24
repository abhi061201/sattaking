import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sattaking/app/global/colors.dart';

class all_game_view extends StatelessWidget {
  all_game_view({super.key});

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
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(
                  image: AssetImage(
                    'assets/images/logo 1.png',
                  ),
                  height: Get.height * 0.08,
                ),
              ],
            ),
            actions: [
              InkWell(
                onTap: () {},
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      child: Icon(Icons.person),
                      radius: 15,
                    ),
                    Text(
                      '  Profile',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Text(
                  'Results : City',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                // 1-10
                customContainer('Delhi'),

                SizedBox(
                  height: Get.height * 0.02,
                ),
                // 1-10
                customContainer('Noida'),

                SizedBox(
                  height: Get.height * 0.02,
                ),
                // 1-10
                customContainer('Gaz'),

                SizedBox(
                  height: Get.height * 0.02,
                ),
                // 1-10
                customContainer('Rohtak'),

                SizedBox(
                  height: Get.height * 0.02,
                ),
                // 1-10
                customContainer('Mumbai'),

                SizedBox(
                  height: Get.height * 0.02,
                ),
                // 1-10
                customContainer('Kashmir'),

                SizedBox(
                  height: Get.height * 0.02,
                ),
                // 1-10
                customContainer('UP'),

                SizedBox(
                  height: Get.height * 0.02,
                ),
                // 1-10
                customContainer('Bihar'),

                SizedBox(
                  height: Get.height * 0.02,
                ),
                // 1-10
                customContainer('Lucknow'),

                SizedBox(
                  height: Get.height * 0.02,
                ),
                // 1-10
                customContainer('Noida'),

                SizedBox(
                  height: Get.height * 0.02,
                ),
                customContainer('UP'),

                SizedBox(
                  height: Get.height * 0.02,
                ),
                // 1-10
                customContainer('Bihar'),

                SizedBox(
                  height: Get.height * 0.02,
                ),
                // 1-10
                customContainer('Lucknow'),

                SizedBox(
                  height: Get.height * 0.02,
                ),
                // 1-10
                customContainer('Noida'),

                SizedBox(
                  height: Get.height * 0.02,
                ),
                Center(
                  child: Container(
                    child: Text(
                      'Helpline No: +91 12345 56787',
                      style: TextStyle(
                        color: appcolor().ambercolor,
                        fontSize: 16
                      ),
                    ),
                  ),
                ),
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

  Widget customContainer(String CityName) {
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            '${CityName}',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
          Text(
            'Open',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
          Text(
            'Close',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  Widget belowContainer(int initial, int final_val) {
    return Container(
      margin: EdgeInsets.only(
        top: 2,
      ),
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
