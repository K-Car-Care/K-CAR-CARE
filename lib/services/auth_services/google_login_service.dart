// ignore_for_file: avoid_print, unnecessary_null_comparison, unused_local_variable
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:k_car_care_project/screen/home_screen/home_screen.dart';
import 'package:k_car_care_project/storage_data/user_profile_storage/save_user_data.dart';

import '../../screen/home_screen/1_home_screen.dart';
import 'auth_services.dart';

class LoginController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  String phoneNumber = "";
  GoogleSignIn googleSign = GoogleSignIn();
  static Authentication instance = Get.find();
  late Rx<User?> firebaseUser;
  late Rx<GoogleSignInAccount?> googleSignInAccount;
  final SaveUserData _saveUserData = SaveUserData();

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    googleSignInAccount = Rx<GoogleSignInAccount?>(googleSign.currentUser);

    firebaseUser.bindStream(auth.userChanges());
    // ever(firebaseUser, _setInitialScreen);

    googleSignInAccount.bindStream(googleSign.onCurrentUserChanged);
    // ever(googleSignInAccount, _setInitialScreenGoogle);
  }

  // _setInitialScreen(User? user) {
  //   if (user == null) {
  //     Get.offAll(() => const RegistrationScreen());
  //   } else {
  //     Get.offAll(() => const MyHomeScreen());
  //   }
  // }

  // _setInitialScreenGoogle(GoogleSignInAccount? googleSignInAccount) {
  //   print(googleSignInAccount);
  //   if (googleSignInAccount == null) {
  //     Get.offAll(() => const RegistrationScreen());
  //   } else {
  //     Get.offAll(() => const MyHomeScreen());
  //   }
  // }

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
        await auth.signInWithCredential(credential).then((value) async {
          //Add data to Firestore in Firebase
          addUserToFireStore(
            googleSignInAccount.email,
            googleSignInAccount.photoUrl.toString(),
          );
          
          print("Gmail User: ${googleSignInAccount.email}");
          print("Profile User: ${googleSignInAccount.photoUrl}");
          print("Profile User: ${googleSignInAccount.id}");

          // Save Data into Share Preference
          _saveUserData.saveUserData(
            gmail: googleSignInAccount.email,
            profileUrl: googleSignInAccount.photoUrl.toString(),
            username: googleSignInAccount.displayName.toString(),
            phone: "",
          );
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

  // Function To Store data into FirebaseFirestore
  Future<void> addUserToFireStore(String gmail, String profileUrl) async {
    User? user = FirebaseAuth.instance.currentUser;
    CollectionReference googleUsers =
        FirebaseFirestore.instance.collection('user_google');

    await googleUsers
        .doc(user?.uid)
        .set({
          'uid': user?.uid.toString(),
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
  // void _saveUserData(String? gmail, String? profileUrl,String? username,String? phone) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   List<String> _prevList = prefs.getStringList('recents') ?? [];
  //   // ignore: unnecessary_null_comparison
  //   gmail != null && profileUrl != null
  //       ? _prevList.add(jsonEncode({
  //           "gmail": gmail,
  //           "profile": profileUrl,
  //           "userName":username,
  //           "phoneNumber":phone,
  //         }))
  //       : () {};
  //   prefs
  //       .setStringList("recents", _prevList)
  //       .then((value) => print("done Saving to Prefs"));
  // }

  Future<void> signup(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      // Getting users credential
      UserCredential result = await auth.signInWithCredential(authCredential);
    User? user = result.user;

      // ignore: unnecessary_null_comparison
      if (result != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const MyHomeScreen()));
      } // if result not null we simply call the MaterialpageRoute,
      // for go to the HomePage screen
    }
  }
}
