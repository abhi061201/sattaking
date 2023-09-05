import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sattaking/app/global/colors.dart';

Widget contactUs_Widget() {
  return Column(
    children: [
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
  );
}
