// ignore_for_file: avoid_print, non_constant_identifier_names, deprecated_member_use, prefer_const_constructors, prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:k_car_care_project/constant/theme_constant.dart';

import '../../data/check_connectivity/check_connectivity.dart';
import '../../data/login_api/login_token_api.dart';
import '../../services/auth_services/auth_services.dart';

class OTPVerificationScreen extends StatefulWidget {
  final String phoneNum;
  final String diaCode;

  OTPVerificationScreen({
    Key? key,
    required this.phoneNum,
    required this.diaCode,
  }) : super(key: key);
  @override
  _OTPVerificationScreenState createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _pinOTPCodeController = TextEditingController();
  final FocusNode _pinOTPcodeFocus = FocusNode();

  final Authentication _authentication = Get.put(Authentication());
  final AccessToken _accessToken = AccessToken();
  @override
  void initState() {
    _authentication.signInwithPhoneNumber(
        my_phone_num: "${widget.diaCode}${widget.phoneNum}");
    print("${widget.diaCode}${widget.phoneNum}");
    CheckInternet().checkConnection(context);
    super.initState();
  }

  @override
  void dispose() {
    CheckInternet().listener?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            print("Back");
            Get.back();
          },
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.black,
            size: 30,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .08),
                ),
                Text(
                  "Veritication",
                  style: ThemeConstant.textTheme.headline6!.copyWith(
                    color: ThemeConstant.lightScheme.secondary,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .03),
                ),
                Text(
                  "We sent you an SMS code",
                  style: ThemeConstant.textTheme.headline5!.copyWith(
                    color: ThemeConstant.lightScheme.onBackground,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .02),
                ),
                RichText(
                  text: TextSpan(
                    text: "On number: ",
                    style: ThemeConstant.textTheme.bodyText1!.copyWith(
                      color: ThemeConstant.lightScheme.secondary,
                    ),
                    children: [
                      TextSpan(
                          text: widget.diaCode.toString(),
                          style: ThemeConstant.textTheme.bodyText1!.copyWith(
                            color: ThemeConstant.lightScheme.primary,
                          ),
                          children: [
                            TextSpan(
                              text: widget.phoneNum.toString(),
                            )
                          ]),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .03),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: PinPut(
                    fieldsCount: 6,
                    eachFieldWidth: 40.0,
                    eachFieldHeight: 50.0,
                    focusNode: _pinOTPcodeFocus,
                    controller: _pinOTPCodeController,
                    textStyle: ThemeConstant.textTheme.subtitle1!.copyWith(
                      color: ThemeConstant.lightScheme.onBackground,
                    ),
                    submittedFieldDecoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    selectedFieldDecoration: BoxDecoration(
                      color: Color(0xffF8F8F8),
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(
                        color: Color(0xffE5E5E5),
                      ),
                    ),
                    followingFieldDecoration: BoxDecoration(
                      color: Color(0xffE5E5E5),
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(
                        color: Color(0xffE5E5E5),
                      ),
                    ),
                    pinAnimationType: PinAnimationType.slide,
                    onSubmit: (pin) async {},
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                Row(
                  children: [
                    Text(
                      "Didn't recieve the code? ",
                      style: ThemeConstant.textTheme.bodyText2!.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Resend",
                      style: ThemeConstant.textTheme.bodyText2!.copyWith(
                        color: ThemeConstant.lightScheme.primary,
                      ),
                    ),
                    Text(
                      "(30s)",
                      style: ThemeConstant.textTheme.bodyText2!.copyWith(
                        color: ThemeConstant.lightScheme.primary,
                      ),
                    ),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * .07)),
                Center(
                  child: Column(
                    children: [
                      RaisedButton(
                        splashColor: Colors.white.withOpacity(.25),
                        color: ThemeConstant.lightScheme.primary,
                        shape: CircleBorder(),
                        onPressed: () {
                          _authentication.myCredentials(
                            _authentication.veri_result,
                            _pinOTPCodeController.text,
                          );
                          print(_pinOTPCodeController);
                          _accessToken.accessToken("phoneNumber");
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
                      SizedBox(height: 4),
                      Text(
                        "Comfirm",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 16,
                          color: ThemeConstant.lightScheme.primary,
                          fontWeight: FontWeight.w600,
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
    );
  }
}
