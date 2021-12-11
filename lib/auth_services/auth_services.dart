import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  FirebaseAuth auth = FirebaseAuth.instance;
  Future createUserWithPhone(String phone, BuildContext context) async {
    try {
      // await auth.verifyPhoneNumber(
      //   phoneNumber: phone,
      //   verificationCompleted: (AuthCredential authCredential){},
      //   verificationFailed: verificationFailed,
      //   codeSent: codeSent,
      //   codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      // );
    } catch (e) {}
  }
}
