// ignore_for_file: prefer_const_constructors, avoid_print, deprecated_member_use, unrelated_type_equality_checks, unused_field
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:k_car_care_project/core/constant/theme_constant.dart';
import '../../core/data/check_connectivity/check_connectivity.dart';
import '../../core/data/login_api/login_token_api.dart';
import '../../core/services/auth_services/auth_services.dart';
import '../../core/services/auth_services/google_login_service.dart';
import '../../core/shared/typography.dart';

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
  final LoginController _loginController = Get.put(LoginController());

  String? verificationId;

  String? dialCode;
  final AccessToken _accessToken = AccessToken();

  @override
  void initState() {
    CheckInternet().checkConnection(context);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
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
                  // ignore: prefer_const_literals_to_create_immutables
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Center(
                      child: SizedBox(
                        child: Image.asset('assets/service_images/logo.png',height: 120,width: 120),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'One account. One place to manage it all.\n Welcome to K-CAR-CARE.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey
                      )
                    ),
                    const SizedBox(height: 20),
                    GoogleBtn(
                      title: 'Login with Google',
                      img: 'https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-suite-everything-you-need-know-about-google-newest-0.png',
                      onPressed: () async {
                        await _loginController.signInWithGoogle(context: context);
                        //wait _loginController.signup(context);
                        // _loginController1.login();
                        print("Google");
                      },
                    ),
                    GoogleBtn(
                      title: 'Login with Facebook',
                      img: 'https://www.facebook.com/images/fb_icon_325x325.png',
                      onPressed: (){}  
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * .05),
                    divider('or Login with Phone Number'),
                    SizedBox(height: MediaQuery.of(context).size.height * .05),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(width: 0.5, color: Colors.grey.withOpacity(0.3)),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
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
                            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                          ),
                          ignoreBlank: false,
                          autoValidateMode: AutovalidateMode.disabled,
                          selectorTextStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          initialValue: number,
                          maxLength: 12,
                          hintText: "Phone number",
                          keyboardType: TextInputType.numberWithOptions(
                            signed: true,
                            decimal: true,
                          ),
                          inputBorder: InputBorder.none,
                          textStyle: TextStyle(
                            fontSize: 16,
                            color:Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          onSaved: (PhoneNumber number) {
                            print('On Saved: $number');
                            setState(
                              (){
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
                    SubmitButton(
                      text: 'Submit',
                      onPressed: () async {
                        // _authentication.signInwithPhoneNumber(
                        // my_phone_num: "$dialCode${controller.text.trim()}");
                        _accessToken.login(
                          phoneNumber:"$dialCode${controller.text}",
                          googleId:'',
                          displayName:'',
                          firstName:'',
                          lastName:'',
                          email:'',
                          profile:'', 
                          cloudinary_id:'',
                          context:context,
                          status:'phone'
                        );
                      },
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

Widget divider(String title) {
  return Container(
    color: Colors.white.withOpacity(0.5),
    child: Row(children: <Widget>[
      Expanded(
        child: Container(
            margin: const EdgeInsets.only(left: 10.0, right: 15.0),
            child: const Divider(
              color: Colors.black,
              height: 50,
            )),
      ),
      Text(title, style:subTitleTextStyleBlack.copyWith(fontWeight: FontWeight.w400,color: Colors.grey)),
      Expanded(
        child: Container(
            margin: const EdgeInsets.only(left: 15.0, right: 10.0),
            child: const Divider(
              color: Colors.black,
              height: 50,
            )),
      ),
    ]),
  );
  }
}


class GoogleBtn extends StatelessWidget {
  final Function()? onPressed;
  final String? img;
  final String? title;
  const GoogleBtn({
    this.onPressed,
    this.title,
    this.img,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      margin: const EdgeInsets.symmetric(vertical: 8,),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 0.5, color: Colors.grey.withOpacity(0.2)),
        color: Colors.white,
      ),
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            side: BorderSide(color: Colors.grey.withOpacity(0.2)),
            borderRadius: BorderRadius.circular(8))
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Image.network(img!,height: 30, width: 30)),
            // const SizedBox(
            //   width: 10,
            // ),
            Expanded(
              flex: 4,
              child: Text(title!,textAlign: TextAlign.start, style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ))),
          ],
        ),
        onPressed: onPressed,
      )
    );
  }
}



class SubmitButton extends StatelessWidget {
  final String? text;
  final Function()? onPressed;
  final EdgeInsetsGeometry? padding;
  const SubmitButton({
    this.text, 
    this.onPressed, 
    this.padding = const EdgeInsets.all(0), 
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    const accentColor = Color(0xffffffff);
    const double borderRadius = 8;

    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: SizedBox(
        height: 55,
        width: MediaQuery.of(context).size.width,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: defaultColor
          ),
          child: ElevatedButton(
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                alignment: Alignment.center,
                padding: MaterialStateProperty.all(
                    const EdgeInsets.only(top: 15, bottom: 15)),
                backgroundColor:
                    MaterialStateProperty.all(Colors.transparent),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadius)),
                )),
            onPressed: onPressed,
            child: Text(text!,style: titleTextStyleBlack.copyWith(fontWeight: FontWeight.bold)))
        ),
      ),
    );
  }
}