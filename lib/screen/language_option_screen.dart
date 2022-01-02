// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_car_care_project/screen/home_screen/home_screen.dart';
import 'package:k_car_care_project/translation/translations_controller.dart';

class ChooseLanguageScreen extends StatelessWidget {
  const ChooseLanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final messageController = Get.put(MessageController());
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Spacer(),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color(0xFF0F3EB6),
                  ),
                ),
                onPressed: () {
                  debugPrint("Khmer Language");
                  messageController.changeLaguage('kh', 'KH');
                  Get.to(
                    () {
                      return const MyHomeScreen();
                    },
                  );
                },
                child: const Text(
                  "ខ្មែរ",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color(0xFF0F3EB6),
                  ),
                ),
                onPressed: () {
                   messageController.changeLaguage('en', 'US');
                  Get.toNamed('myhomescreen');
                },
                child: const Text(
                  "English",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
