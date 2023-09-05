import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class win_history_controller extends GetxController {
  RxString startdate = ''.obs;
  RxString enddate = ''.obs;
  DateTime? pickedDate;
  Future<void> showdatepickerstart(BuildContext context) async {
    pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      print(pickedDate);
      startdate.value = DateFormat('dd-MMM-yyyy').format(pickedDate!);
      print(startdate.value);
    }
  }
  Future<void> showdatepickerend(BuildContext context) async {
    pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      print(pickedDate);
      enddate.value = DateFormat('dd-MMM-yyyy').format(pickedDate!);
      print(enddate.value);
    }
  }
}
