// ignore_for_file: prefer_const_constructors, avoid_print, deprecated_member_use, unrelated_type_equality_checks, unused_field

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:k_car_care_project/constant/theme_constant.dart';

import 'package:k_car_care_project/screen/authenication_screen/otp_verification_screen.dart';

import '../../data/check_connectivity/check_connectivity.dart';
import '../../data/login_api/login_token_api.dart';
import '../../services/auth_services/auth_services.dart';
import '../../services/auth_services/google_login_service.dart';

// import 'package:k_car_care_project/data/notification_api/notification_api.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  String initialCountry = 'CAM';
  PhoneNumber number = PhoneNumber(isoCode: 'KH');
  String verificationIDRecieved = "";

  final Authentication _authentication = Get.put(Authentication());
  final LoginController _loginController = Get.put(LoginController());

  String? verificationId;
  String? dialCode;
  bool continues = false;
  final AccessToken _accessToken = AccessToken();
  late String isValidate;

  @override
  void initState() {
    isValidate = "";
    CheckInternet().checkConnection(context);
    super.initState();
  }

  @override
  void dispose() {
    phoneController.dispose();
    CheckInternet().listener?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.topLeft,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .04,
                    ),
                    Text(
                      "WELCOME_REGISTER".tr,
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: "Poppins",
                        color: Color(0xff979797),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "PLEASE_FILL".tr,
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: "Poppins",
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .1,
                    ),
                    Text(
                      //    "សម្រាប់ឧទាហរណ៍​: ជ្រើសរើស កូដប្រទេស​​ លេខទូរសព្ទ័",
                      "EXAMPLE".tr,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Poppins",
                        color: Colors.black,
                      ),
                    ),

                    //Validate Phone number
                    AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: isValidate == ""
                            ? MediaQuery.of(context).size.height * .02
                            : MediaQuery.of(context).size.height * .04),
                    Text(
                      isValidate,
                      style: ThemeConstant.textTheme.subtitle1!.copyWith(
                        color: Colors.red,
                      ),
                    ),
                    AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: isValidate == ""
                            ? MediaQuery.of(context).size.height * .01
                            : MediaQuery.of(context).size.height * .02),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: isValidate == ""
                              ? Colors.black.withOpacity(.25)
                              : Colors.red.withOpacity(.85),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.25),
                            offset: Offset(1.0, 1.0),
                            blurRadius: 10.0,
                            spreadRadius: 1.0,
                          ),
                          BoxShadow(
                            color: Colors.black.withOpacity(.25),
                            offset: Offset(-1.0, -1.0),
                            blurRadius: 10.0,
                            spreadRadius: 1.0,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 4.0),
                        child: InternationalPhoneNumberInput(
                          textFieldController: phoneController,
                          onInputChanged: (PhoneNumber number) {
                            setState(() {
                              dialCode = number.dialCode;
                            });
                          },
                          onInputValidated: (bool value) {
                            print("OnINputValidated $value");
                          },
                          selectorConfig: SelectorConfig(
                            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                          ),
                          ignoreBlank: false,
                          autoValidateMode: AutovalidateMode.disabled,
                          selectorTextStyle: TextStyle(
                            color: Colors.black,
                            fontFamily: "Poppins",
                          ),
                          initialValue: number,
                          maxLength: 12,
                          hintText: "ឧទាហរណ៍ 123 456 7",
                          keyboardType: TextInputType.numberWithOptions(
                            signed: true,
                            decimal: true,
                          ),
                          inputBorder: InputBorder.none,
                          textStyle: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 16,
                          ),
                          onSaved: (PhoneNumber number) {
                            print('On Saved: $number');
                            setState(
                              () {
                                dialCode == number;
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .05,
                    ),
                    Center(
                      child: Column(
                        children: [
                          RaisedButton(
                            splashColor: Colors.white.withOpacity(.25),
                            color: Colors.black,
                            shape: CircleBorder(),
                            onPressed: () {
                              if (phoneController.text.isEmpty ||
                                  phoneController.text == "") {
                                setState(() {
                                  isValidate = "Please enter your phonenumber";
                                });
                              } else if (phoneController.text.length <= 8) {
                                print("Phonenumber must be 8 digit");
                                setState(() {
                                  isValidate = "Phone number must be 8 digit";
                                });
                              } else {
                                setState(() {
                                  isValidate = "";
                                });
                                var phoneEdit = phoneController.text
                                    .replaceFirst(RegExp(r'^0+'), "");
                                print("$dialCode$phoneEdit");
                                Get.to(
                                  () => OTPVerificationScreen(
                                    phoneNum: phoneEdit,
                                    diaCode: dialCode.toString(),
                                  ),
                                );
                              }
                              //   CustomFullScreenDialog();
                              // if (formKey.currentState!.validate()) {
                              //   Get.defaultDialog(
                              //     titlePadding: const EdgeInsets.only(top: 20),
                              //     title: "Email and Password\nincorrect ",
                              //     middleText: "Please try again",
                              //     backgroundColor: Colors.red,
                              //     titleStyle:
                              //         const TextStyle(color: Colors.white),
                              //     middleTextStyle: ThemeConstant
                              //         .textTheme.bodyMedium!
                              //         .copyWith(
                              //       fontSize: 14,
                              //       color: Colors.white,
                              //     ),
                              //   );
                              //   setState(() {
                              //     continues = true;
                              //   });
                              //   //  CustomFullScreenDialog();
                              //   print("$dialCode${phoneController.text}");
                              //   var phoneEdit = phoneController.text
                              //       .replaceFirst(RegExp(r'^0+'), "");
                              //   // _authentication.signInwithPhoneNumber(
                              //   //     my_phone_num: "$dialCode$phoneEdit");
                              //   print("{$dialCode$phoneEdit}");
                              //   // _accessToken.accessToken("phoneNumber");

                              // } else {
                              //   print("in valid");
                              //   //   CustomFullScreenDialog();
                              // }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Icon(
                                Icons.chevron_right,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Text(
                            "បន្ត",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .02,
                          ),
                          Text(
                            "ឬ",
                            style:
                                TextStyle(fontFamily: "Poppins", fontSize: 14),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .02,
                          ),
                        ],
                      ),
                    ),
                    // : CircularProgressIndicator(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () async {
                            // await _loginController.signInWithGoogle();
                            //  await _loginController.signup(context);
                            //  _loginController1.login();
                            print("Google");
                          },
                          child: Column(
                            children: [
                              SvgPicture.asset("assets/icons/google.svg"),
                              Text(
                                "Google",
                                style: TextStyle(
                                    fontFamily: "Poppins", fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            print("Facebook");
                          },
                          child: Column(
                            children: [
                              Image.asset("assets/icons/Facebook.png"),
                              Text(
                                "Facebook",
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "តើអ្នកមានគណនីហើយឬនៅ?",
                            style:
                                TextStyle(fontFamily: "Poppins", fontSize: 14),
                          ),
                          TextButton(
                            onPressed: () {
                              print("Login");
                            },
                            child: Text(
                              "ចូលប្រើ នៅទីនេះ",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 14,
                                color: ThemeConstant.lightScheme.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
        await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'KH');
    setState(() {
      this.number = number;
    });
  }
}
