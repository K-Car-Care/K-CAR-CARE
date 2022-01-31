// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_car_care_project/auth_services/auth_services.dart';
import 'package:k_car_care_project/services/check_connectivity/check_connectivity.dart';
import 'package:k_car_care_project/services/google_login/google_login_api.dart';

class NavigationDrawerWidget extends StatefulWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  _NavigationDrawerWidgetState createState() =>
      // ignore: unnecessary_new
      new _NavigationDrawerWidgetState();
}

const expandedHeight = 200.0;

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  // late ScrollController _scrollController;
  String text = 'https://sala.koompi.com';
  String subject = 'View here';
  final GoogleLogin _googleLogin = GoogleLogin();
  bool _islogin = false;

  @override
  void initState() {
    CheckInternet().checkConnection(context);
    super.initState();
  }

  final Authentication _authentication = Get.put(Authentication());
  @override
  void dispose() {
    CheckInternet().listener?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Material(
      color: Colors.white,
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xff0185BE),
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Item 1'),
            onTap: () {
              _authentication.signOut();
              setState(() {
                _islogin = true;
              });

              // _googleLogin
              //     .googlelogin(
              //         displayName: "df",
              //         email: "df",
              //         firstName: "sdf",
              //         lastName: "asdf",
              //         phone: "sdf00")
              //     .then((value) {
              //   setState(() {
              //     _islogin = true;
              //   });
              //   print("login surr");
              // });
            },
          ),
          _islogin == false
              ? ListTile(
                  title: const Text('Item 2'),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                )
              : const CircularProgressIndicator(),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: const Text('Item 3'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: const Text('Item 4'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: const Text('Item 5'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),
    ));
  }
}
