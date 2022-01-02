// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_car_care_project/translation/translations_controller.dart';

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
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'hello'.tr,
              style: const TextStyle(
                fontSize: 28,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'logged_in'.trParams(
                {
                  'name': "Ruize",
                  'email': 'sinat@gmail.com',
                },
              ),
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                messageController.changeLaguage('en', 'US');
              },
              child: const Text(
                "English",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                messageController.changeLaguage('es', 'ES');
              },
              child: const Text(
                "Spanish",
              ),
            ),
          ],
        ),
      )),
    );
  }
}
