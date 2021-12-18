// ignore_for_file: prefer_const_constructors, avoid_print, deprecated_member_use, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:k_car_care_project/auth_services/auth_services.dart';
import 'package:k_car_care_project/constant/theme_constant.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();
  String initialCountry = 'CAM';
  PhoneNumber number = PhoneNumber(isoCode: 'KH');
  String verificationIDRecieved = "";

  final Authentication _authentication = Get.put(Authentication());
  String? verificationId;

  String? dialCode;

  @override
  void initState() {
    super.initState();
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
                      // ignore: prefer_const_literals_to_create_immutables
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .04,
                        ),
                        Text(
                          "សូមស្វាគមន៍មកកាន់ទីនេះ",
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
                          "បំពេញទម្រង់បែបបទដើម្បីក្លាយជាភ្ញៀវរបស់យើង",
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
                          "សម្រាប់ឧទាហរណ៍​: ជ្រើសរើស កូដប្រទេស​​ លេខទូរសព្ទ័",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Poppins",
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * .05),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black.withOpacity(.25),
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
                              textFieldController: controller,
                              onInputChanged: (PhoneNumber number) {
                                setState(() {
                                  dialCode = number.dialCode;
                                });
                              },
                              onInputValidated: (bool value) {
                                print(value);
                              },
                              selectorConfig: SelectorConfig(
                                selectorType:
                                    PhoneInputSelectorType.BOTTOM_SHEET,
                              ),
                              ignoreBlank: false,
                              autoValidateMode: AutovalidateMode.disabled,
                              selectorTextStyle: TextStyle(
                                color: Colors.black,
                                fontFamily: "Poppins",
                              ),
                              initialValue: number,
                              maxLength: 9,
                              hintText: "ឧ​.ទា 123 456 7",
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
                                onPressed: () async {
                                  _authentication.signInwithPhoneNumber(
                                      my_phone_num:
                                          "$dialCode${controller.text}");
                                  print("$dialCode${controller.text}");
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
                                height:
                                    MediaQuery.of(context).size.height * .02,
                              ),
                              Text(
                                "ឬ",
                                style: TextStyle(
                                    fontFamily: "Poppins", fontSize: 14),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .02,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () async {
                                _authentication.signInWithGoogle();

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
                                  SvgPicture.asset("assets/icons/google.svg"),
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
                                style: TextStyle(
                                    fontFamily: "Poppins", fontSize: 14),
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

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
