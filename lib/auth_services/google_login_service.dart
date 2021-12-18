// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:k_car_care_project/auth_services/auth_services.dart';
import 'package:k_car_care_project/model/userData/google_model.dart';
import 'package:k_car_care_project/screen/authenication_screen/registration_screen.dart';
import 'package:k_car_care_project/screen/home_screen/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  String phoneNumber = "";
  GoogleSignIn googleSign = GoogleSignIn();
  static Authentication instance = Get.find();
  late Rx<User?> firebaseUser;
  late Rx<GoogleSignInAccount?> googleSignInAccount;

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    googleSignInAccount = Rx<GoogleSignInAccount?>(googleSign.currentUser);

    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);

    googleSignInAccount.bindStream(googleSign.onCurrentUserChanged);
    ever(googleSignInAccount, _setInitialScreenGoogle);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => const RegistrationScreen());
    } else {
      Get.offAll(() => const MyHomeScreen());
    }
  }

  _setInitialScreenGoogle(GoogleSignInAccount? googleSignInAccount) {
    print(googleSignInAccount);
    if (googleSignInAccount == null) {
      Get.offAll(() => const RegistrationScreen());
    } else {
      Get.offAll(() => const MyHomeScreen());
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await googleSign.signIn();

      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        await auth.signInWithCredential(credential).then((value) {
          addUserToFireStore(googleSignInAccount.email,
              googleSignInAccount.photoUrl.toString());
          print("Gmail User: ${googleSignInAccount.email}");
          print("Profile User: ${googleSignInAccount.photoUrl}");
          _saveUserData(googleSignInAccount.email,
              googleSignInAccount.photoUrl.toString(),googleSignInAccount.displayName.toString(),);
        }).catchError((onErr) {
          print(onErr);
        });
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
      print(e.toString());
    }
  }

  Future<void> addUserToFireStore(String gmail, String profileUrl) async {
    CollectionReference googleUsers =
        FirebaseFirestore.instance.collection('user_google');

    await googleUsers
        .add({
          'gmail': gmail,
          'profileUrl': profileUrl,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  // SignOut Google Account
  void signOut() async {
    await auth.signOut();
  }

  // Save User Data using SharePreference
  void _saveUserData(String gmail, String profileUrl,String username) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> _prevList = prefs.getStringList('recents') ?? [];
    // ignore: unnecessary_null_comparison
    gmail != null && profileUrl != null
        ? _prevList.add(jsonEncode({
            "gmail": gmail,
            "profile": profileUrl,
            "userName":username,
          }))
        : () {};
    prefs
        .setStringList("recents", _prevList)
        .then((value) => print("done Saving to Prefs"));
  }
}
