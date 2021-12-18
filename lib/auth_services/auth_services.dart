// ignore_for_file: avoid_print, null_check_always_fails, non_constant_identifier_names, invalid_return_type_for_catch_error
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:k_car_care_project/model/userData/phone_number_model.dart';
import 'package:k_car_care_project/screen/authenication_screen/otp_verification_screen.dart';
import 'package:k_car_care_project/screen/authenication_screen/registration_screen.dart';
import 'package:k_car_care_project/screen/home_screen/home_screen.dart';

class Authentication extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  String phoneNumber = "";
  GoogleSignIn googleSign = GoogleSignIn();
  static Authentication instance = Get.find();
  late Rx<User?> firebaseUser;
  late Rx<GoogleSignInAccount?> googleSignInAccount;
  var status_string = "Welcome".obs;
  var code_sent = "no".obs;
  var verificatoin_id = "1".obs;
  String get status_result => status_string.value;
  String get code_sent_result => code_sent.value;
  String get veri_result => verificatoin_id.value;

  final DataPhoneNumber _dataPhoneNumber = DataPhoneNumber();

  CollectionReference users =
      FirebaseFirestore.instance.collection('user_phoneNumber');

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

  void signInWithGoogle() async {
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
          googleUserData(googleSignInAccount.email,
              googleSignInAccount.photoUrl.toString());
          print(googleSignInAccount.email);
          print(googleSignInAccount.photoUrl);
        }).catchError((onErr) => print(onErr));
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

  Future<void> googleUserData(String gmail, String profileUrl) async {
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

  // SigInwithPhone Number
  void signInwithPhoneNumber({required String my_phone_num}) async {
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
        Get.to(OTPVerificationScreen(phoneNum: my_phone_num));
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Auto-resolution timed out...
      },
    )
        .then((value) {
      users
          .add({
            'country': "cambodia",
            'phoneNumber': my_phone_num, // Stokes and Sons
            // 42
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    });
  }

  myCredentials(String verID, String userInput) {
    AuthCredential authCredential =
        PhoneAuthProvider.credential(verificationId: verID, smsCode: userInput);
    auth.signInWithCredential(authCredential).then((value) {
      // Get.to(MyHomeScreen());
    }).catchError((e) {
      print("Error Message $e");
      Get.snackbar("Hello", e);
    });
  }
}
