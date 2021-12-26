
// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final IconData? icon;
  final Function()? onTap;
  CircleButton({Key? key, this.icon, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(25.0),
      child: Container(
        width: 50.0,
        height: 50.0,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Card(
          elevation: 1.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Icon(
            icon,
            color: const Color(0xFF6D6D6D),
            size: 15.0,
          ),
        ),
      ),
    );
  }
}