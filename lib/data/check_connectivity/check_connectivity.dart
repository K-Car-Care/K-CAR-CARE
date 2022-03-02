// ignore_for_file: non_constant_identifier_names, deprecated_member_use, prefer_const_constructors

import 'dart:async';

import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class CheckInternet {
  StreamSubscription<InternetConnectionStatus>? listener;
  var InternetStatus = "Unknown";
  var contentmessage = "Unknown";

  void _showDialog(String title, String content, BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text("អ្នកមិនបានភ្ជាប់ទៅកាន់អ៊ីនធឺណិត"),
          content: Text(
            content,
          ),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  AppSettings.openAppSettings();
                },
                child: Text("ទិន្នន័យចល័ត (Mobile data)")),
            FlatButton(
                onPressed: () {
                  AppSettings.openWIFISettings();
                },
                child: Text(
                  "វ៉ាយហ្វាយ (WIFI)",
                )),
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "បិទ",
                )),
          ],
        );
      },
    );
  }

  checkConnection(BuildContext context) async {
    listener = InternetConnectionChecker().onStatusChange.listen(
      (status) {
        switch (status) {
          case InternetConnectionStatus.connected:
            InternetStatus = "Connected to the Internet";
            contentmessage = "Connected to the Internet";
            break;
          case InternetConnectionStatus.disconnected:
            InternetStatus = "You are disconnected to the Internet. ";
            contentmessage = "សូមពិនិត្យការភ្ជាប់អ៊ីនធឺណិតរបស់អ្នក";

            _showDialog(InternetStatus, contentmessage, context);
            break;
        }
      },
    );
    return await InternetConnectionChecker().connectionStatus;
  }
}
