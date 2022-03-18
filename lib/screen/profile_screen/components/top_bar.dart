// ignore_for_file: void_checks, prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_car_care_project/screen/authenication_screen/registration_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../services/auth_services/auth_services.dart';
import '../../../widget/black_button_widget.dart';
import '../../home_screen/1_home_screen.dart';

class TopBar extends StatefulWidget {
  const TopBar({
    Key? key,
  }) : super(key: key);

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  final Authentication _auth = Get.put(Authentication());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          buildIcon(
              iconData: Icons.arrow_back,
              onTap: () {
                Get.to(() => MyHomeScreen());
              }),
          buildIcon(
            iconData: Icons.logout_outlined,
            onTap: () async {
              //Go  Logout
              await Get.defaultDialog(
                titlePadding: EdgeInsets.symmetric(vertical: 20),
                contentPadding:
                    EdgeInsets.only(bottom: 30, top: 10, left: 10, right: 10),
                title: "Logout",
                content: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Text("Are you sure you want to logout ?"),
                ),
                radius: 18.0,
                actions: [
                  BlackButton(
                    height: 10,
                    backgroundColor: Colors.red,
                    title: "No",
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  BlackButton(
                    title: "Yes",
                    height: 10,
                    onPressed: () async {
                      _auth.signOut().then(
                        (value) async {
                          SharedPreferences preferences =
                              await SharedPreferences.getInstance();
                          await preferences.remove('recents');
                          await preferences.remove('token');
                        },
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildIcon({required Function onTap, required IconData iconData}) {
    return GestureDetector(
      onTap: () {
        return onTap();
      },
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5), shape: BoxShape.circle),
          padding: const EdgeInsets.all(7),
          // alignment: Alignment.center,
          child: Icon(iconData, color: Colors.black)),
    );
  }
}
