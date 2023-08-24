import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:sattaking/app/global/colors.dart';
import 'package:sattaking/common/starting_view.dart';
import 'package:google_fonts/google_fonts.dart';

Future main()async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  Future.delayed(Duration(seconds: 3));
  FlutterNativeSplash.remove();
  runApp(SattaKing());
  
}

class SattaKing extends StatelessWidget {
  const SattaKing({super.key});
  @override
  Widget build(BuildContext context) {
    // log("working");
    final textTheme = Theme.of(context).textTheme;
    return GetMaterialApp(
      
      
      theme: ThemeData(
      
        textTheme: GoogleFonts.podkovaTextTheme(textTheme).copyWith(
          bodySmall: Theme.of(context).textTheme.bodySmall!.apply(
                color: appcolor().ambercolor,
              ),
          titleSmall: Theme.of(context).textTheme.titleSmall!.apply(
                color: appcolor().ambercolor,
              ),
          titleMedium: Theme.of(context).textTheme.titleMedium!.apply(
                color: appcolor().ambercolor,
              ),
        ),
        
      ),
      debugShowCheckedModeBanner: false,
      home: starting_view(),
    );
  }
}
