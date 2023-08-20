import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sattaking/app/game/view/game_view.dart';
import 'package:sattaking/app/global/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class login_view extends StatelessWidget {
  const login_view({super.key});
  @override
  Widget build(BuildContext context) {
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
        body: SingleChildScrollView(
          child: Container(
            width: Get.width,
            height: Get.height,
            decoration: BoxDecoration(color: Colors.transparent),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                customfield('Mobile Number :', TextInputType.phone, 10),
                TextButton(
                  onPressed: () {
                    
                  },
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size(50, 30),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      alignment: Alignment.centerLeft),
                  child: Text(
                    'Send OTP..',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                customfield('OTP :', TextInputType.phone, 4),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size(50, 30),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      alignment: Alignment.centerLeft),
                  child: Text(
                    'Resend OTP..',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(game_view());
                  },
                  child: Container(
                    margin: EdgeInsets.all(
                      5,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
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
                ),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                Text(
                  'OR',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        FontAwesomeIcons.facebook,
                        color: appcolor().bluecolor,
                        size: 30,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        FontAwesomeIcons.googlePlus,
                        color: appcolor().redcolor,
                        size: 30,
                      ),
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

  Widget customfield(String hintText, TextInputType? keyType, int maxElement) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      width: Get.width * 0.8,
      height: Get.height * 0.065,
      child: TextFormField(
        keyboardType: keyType,
        maxLength: maxElement,
        style: TextStyle(
          color: appcolor().ambercolor,
          fontSize: 18,
        ),
        decoration: InputDecoration(
          counter: Offstage(),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 15,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: appcolor().ambercolor,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
