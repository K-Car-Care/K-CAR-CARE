// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:k_car_care_project/core/constant/theme_constant.dart';

class BBoxWidget extends StatelessWidget {
  const BBoxWidget({
    Key? key,
    this.name,
    this.image, this.tag,
    this.color,
  }) : super(key: key);
  final String? name;
  final String? image;
  final String? tag;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 12,
      height: MediaQuery.of(context).size.height / 3.5,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color(0xffECECEC),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(2, 4),
            blurRadius: 4,
            color: const Color(0xff000000).withOpacity(.1),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 2 - 2,
            height: 3,
            color:defaultColor,
          ),
          SizedBox(
            width: 80,
            height: 80,
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage(
            //       "$image",
            //     ),
            //   ),
            // ),
            child: Image.asset("$image",color:color),
          ),
          Hero(
            tag: tag.toString(),
            child: Text(
              "${name ?? "Error Service"}",
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Vollkorn',
                fontWeight: FontWeight.w500,
                color:color,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}