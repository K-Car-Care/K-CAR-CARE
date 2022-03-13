// ignore_for_file: void_checks, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:k_car_care_project/screen/authenication_screen/registration_screen.dart';
import 'package:k_car_care_project/screen/home_screen/1_home_screen.dart';
// import 'package:k_car_care_project/screen/home_screen/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/services/auth_services/auth_services.dart';

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
            onTap: () {
              //Go  Logout

              _auth.signOut().then(
                (value) async {
                  SharedPreferences preferences =
                      await SharedPreferences.getInstance();
                  await preferences.remove('recents');
                },
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
