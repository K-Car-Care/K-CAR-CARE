// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_car_care_project/screen/authenication_screen/registration_screen.dart';
import 'package:k_car_care_project/translation_screen/translations_controller.dart';

class MessageView extends StatefulWidget {
  const MessageView({Key? key}) : super(key: key);

  @override
  _MessageViewState createState() => _MessageViewState();
}

class _MessageViewState extends State<MessageView> {
  final messageController = Get.put(MessageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(top: 60, bottom: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'WELCOME'.tr,
              style: const TextStyle(
                fontSize: 28,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // Text(
            //   'logged_in'.trParams(
            //     {
            //       'name': "Ruize",
            //       'email': 'sinat@gmail.com',
            //     },
            //   ),
            //   style: const TextStyle(
            //     fontSize: 20,
            //   ),
            // ),
            Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 100,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      messageController.changeLaguage('en', 'US');
                      Get.to(() => RegistrationScreen());
                    },
                    child: const Text(
                      "English",
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 100,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      messageController.changeLaguage('es', 'ES');
                      // Timer(Duration(seconds: 4), () {
                      //   Get.to(() => RegistrationScreen());
                      // });
                      Get.to(() => RegistrationScreen());
                    },
                    child: const Text(
                      "ភាសាខ្មែរ",
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
