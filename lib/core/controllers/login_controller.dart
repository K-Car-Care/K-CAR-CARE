// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:k_car_care_project/core/controllers/home_controller.dart';
import 'package:k_car_care_project/widget/custom_dialog.dart';

class LoginController1 extends GetxController {
  final HomeController _homeController = Get.put(HomeController());

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  void login() async {
    CustomFullScreenDialog();
    GoogleSignInAccount? googleSignInAccount =
        await _homeController.googleSignIn.signIn();
    if (googleSignInAccount == null) {
      CustomFullScreenDialog.showDialog();
    } else {
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      OAuthCredential oAuthCredential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await _homeController.firebaseAuth
          .signInWithCredential(oAuthCredential)
          .then((value) {
        googleSignInAccount.displayName;

        print(
            "profile uid: ${googleSignInAccount.id}${googleSignInAccount.displayName}}");
      });
      CustomFullScreenDialog.cancelDialog();
    }
  }
}
