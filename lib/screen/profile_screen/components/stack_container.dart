import 'dart:ui';

import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:k_car_care_project/screen/profile_screen/components/top_bar.dart';

import 'custom_clipper.dart';

class StackContainer extends StatelessWidget {
  final String cover;
  final String profileImage;
  final String fullName;
  final String role;
  const StackContainer({
    Key? key,
    required this.fullName,
    required this.profileImage,
    required this.cover,
    required this.role,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.0,
      child: Stack(
        children: <Widget>[
          Container(),
          ClipPath(
            clipper: MyCustomClipper(),
            child: Container(
              height: 300.0,
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: NetworkImage(cover),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0, 1),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircularProfileAvatar(
                  profileImage,
                  borderWidth: 4.0,
                  radius: 60.0,
                ),
                const SizedBox(height: 4.0),
                Text(
                  fullName,
                  style: const TextStyle(
                    fontSize: 21.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  role,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
          const TopBar(),
        ],
      ),
    );
  }
}
