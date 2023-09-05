import 'dart:io';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class urlLauncherController extends GetxController {
  
  final Uri uri= Uri.parse('https://www.youtube.com/watch?v=Y2YcG9PqsBM&ab_channel=BMDigitalUtilization');
  // final Uri uri= Uri.parse('https://flutter.dev/');
  Future<void> LaunchUrl() async {
    // if (Platform.isIOS) {
    //   if (await canLaunchUrl(
    //     Uri.parse(
    //       'youtube://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw',
    //     ),
    //   )) {
    //     launchUrl(Uri.parse(
    //         'youtube://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw'));
    //   } else {
    //     if (await canLaunchUrl(
    //       Uri.parse(
    //         'youtube://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw',
    //       ),
    //     )) {
    //       await launchUrl(Uri.parse(
    //           'youtube://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw'));
    //     } else {
    //       throw 'Could not launch https://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw';
    //     }
    //   }
    // } else {
      
      
    // }

    if(! await launchUrl(uri))
    {
      throw Exception('Could not launch $uri');
    }
  }
}
