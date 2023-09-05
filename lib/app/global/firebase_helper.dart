import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sattaking/app/auth/login/view/login.dart';
import 'package:sattaking/app/global/model/user_model.dart';

class firebase_helper {
  static Future<UserModel?> getUserModel(String mobile_no) async {
    UserModel? usermodel;

    DocumentSnapshot? snapshot =
        await FirebaseFirestore.instance.collection('Users').doc(mobile_no).get();

    if (snapshot.data() != null) {
      usermodel = UserModel.fromMap(snapshot.data() as Map<String, dynamic>);
    }
    return usermodel;
  }

  static Future<void> setUserData(UserModel userModel) async {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(userModel.mobile_no)
        .set(userModel.toMap());
  }

  static Future<void> firebase_logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAll(login_view());
  }

  static Future<void> resetPassword(UserModel usermodel)async
  {
    String email= usermodel.email!;
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email:email);
    }
    catch(e)
    {
      Get.snackbar('Error', e.toString());
    }
  }
}
