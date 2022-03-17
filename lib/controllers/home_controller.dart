// ignore_for_file: unnecessary_overrides, await_only_futures

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:k_car_care_project/screen/authenication_screen/registration_screen.dart';
import 'package:k_car_care_project/screen/home_screen/1_home_screen.dart';

class HomeController extends GetxController {
  late GoogleSignIn googleSignIn;
  var isSignIn = false.obs;

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    googleSignIn = GoogleSignIn();
    ever(isSignIn, handleAuthStateChanged);
    isSignIn.value = await firebaseAuth.currentUser != null;

    firebaseAuth.authStateChanges().listen((event) {
      isSignIn.value = event != null;
    });

    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void handleAuthStateChanged(isloggedIn) {
    if (isloggedIn) {
      Get.off(() => const MyHomeScreen(), arguments: firebaseAuth.currentUser);
    } else {
      Get.offAll(() => const RegistrationScreen());
    }
  }
}
