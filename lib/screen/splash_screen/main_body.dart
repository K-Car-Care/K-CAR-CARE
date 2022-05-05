
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:k_car_care_project/core/constant/theme_constant.dart';
import 'package:k_car_care_project/screen/authenication_screen/registration_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),()=> Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrationScreen())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultColor,
      body:Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: SizedBox(
              // height: 100,
              // width: 100,
              // decoration: const BoxDecoration(
              //   image: DecorationImage(
              //     image: AssetImage('assets/service_images/logo.png')
              //   )
              // ),
              child: Image.asset('assets/service_images/logo.png',color:black,height: 200,width: 200),
            ),
          ),
          const Positioned(
            bottom: 50 ,
            child: CupertinoActivityIndicator(
              radius: 20.0,
            )
          )
        ],
      ),
    );
  }
}
