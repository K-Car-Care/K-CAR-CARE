// ignore_for_file: avoid_print, null_check_always_fails, non_constant_identifier_names, invalid_return_type_for_catch_error, unused_local_variable
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:k_car_care_project/screen/authenication_screen/otp_verification_screen.dart';
import 'package:k_car_care_project/storage_data/user_profile_storage/save_user_data.dart';

class Authentication extends GetxController {

  var status_string = "Welcome".obs;
  var code_sent = "no".obs;
  var verificatoin_id = "1".obs;
  String get status_result => status_string.value;
  String get code_sent_result => code_sent.value;
  String get veri_result => verificatoin_id.value;

  
  // SignOut Google Account
  Future<void> signOut() async {
    await auth.signOut();
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  final SaveUserData _saveUserData = SaveUserData();

  CollectionReference users =
      FirebaseFirestore.instance.collection('user_phoneNumber');

  User? user = FirebaseAuth.instance.currentUser;

  // SigInwithPhone Number
  Future<void> signInwithPhoneNumber({required String my_phone_num}) async {
    await auth
        .verifyPhoneNumber(
      phoneNumber: my_phone_num,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseException exception) {
        status_string.value = "Error verifying your phone number";
        if (exception.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificatoinID, int? resendToken) {
        code_sent.value = "yes";
        print(code_sent.value);
        print(verificatoinID);
        verificatoin_id.value = verificatoinID;
        _saveUserData.saveUserData(
          gmail: "",
          profileUrl: "", 
          username: '',
          phone: my_phone_num,
        );
        Get.to(OTPVerificationScreen(phoneNum: my_phone_num));
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Auto-resolution timed out...
      },
    )
        .then((value) {
    
    });
  }

  myCredentials(String verID, String userInput) {
    AuthCredential authCredential =
        PhoneAuthProvider.credential(verificationId: verID, smsCode: userInput);
    auth.signInWithCredential(authCredential).then((value) {
      users
          .doc(user?.uid)
          .set({
            'uid': user?.uid,
            'country': "cambodia",
            'phoneNumber': "my_phone_num",
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
      print(authCredential.providerId);
      // Get.to(MyHomeScreen());
    }).catchError((e) {
      print("Error Message $e");
      Get.snackbar("Hello", e);
    });
  }
}
