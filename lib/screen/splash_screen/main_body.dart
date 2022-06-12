import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:k_car_care_project/core/backend/socket_conf/socket_core.dart';
import 'package:k_car_care_project/core/constant/theme_constant.dart';
import 'package:k_car_care_project/screen/authenication_screen/registration_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  
  final SocketService socketService = SocketService();

  @override
  void initState() {
    super.initState();
    onSocket();
    Timer(const Duration(seconds: 3),()=> Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrationScreen())));
  }

   void onSocket() async{  
    print('data');
    await socketService.createSocketConnection().on('/connection', (data) async {
      print('Hello data connection hello$data');
    });
    // await socketService.createSocketConnection().emit('say_hello', {
    //   // print('Hello data connection hello$data');
    //   'message':'Say Bye to Sokhour.'
    // });

    // await socketService.createSocketConnection().on('/say_bye', (data) async {
    //   // await telephony.sendSms(to: data["to"], message: data["message"]);
    //   print('Bye data say hello$data');
    // });

    await socketService.createSocketConnection().on('/say_hello', (data) async {
      // await telephony.sendSms(to: data["to"], message: data["message"]);
      print('Hello data say hello$data');
    });

    await socketService.createSocketConnection().on('/car', (data) async {
      // await telephony.sendSms(to: data["to"], message: data["message"]);
      print('Hello data say hello$data');
    });

    await socketService.createSocketConnection().on('/user-request-towing', (data) async {
      // await telephony.sendSms(to: data["to"], message: data["message"]);
      print('Hello data user request $data');
    });

    await socketService.createSocketConnection().on('/reply-qoute-to-user-request', (data) async {
      // await telephony.sendSms(to: data["to"], message: data["message"]);
      print('Hello data user request $data');
    });

    
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
