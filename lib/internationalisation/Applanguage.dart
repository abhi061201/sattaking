

import 'package:get/get.dart';

class AppLanguage extends Translations{
  
  @override
  Map<String, Map<String , String>> get keys=>{
    'en_US':{
     'Mobile Number':'Mobile Number',
      'Password':'Password',
      'Forgot Password':'Forgot Password'
    },
    'hi_IN':{
      'Mobile Number':'मोबाइल नंबर',
      'Password':'पासवर्ड',
      'Forgot Password':'पासवर्ड भूल गए'
    }
  };

}