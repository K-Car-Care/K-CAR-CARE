// ignore_for_file: prefer_const_constructors, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:k_car_care_project/widget/circle_button.dart';

class DetailNotificationScreen extends StatelessWidget {
  String? title;
  String? desc;
  String? datetime;
  String? image;
  DetailNotificationScreen({
    Key? key,
    this.title,
    this.desc,
    this.datetime,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65.0),
        child: Center(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(18.0, 15.0, 18.0, 0),
              child: Row(
                children: [
                  CircleButton(
                    icon: Icons.arrow_back_ios,
                    onTap: () => Navigator.pop(context),
                  ),
                  const Spacer(),
                  CircleButton(
                    icon: Icons.share,
                    onTap: () {},
                  ),
                  CircleButton(
                    icon: Icons.favorite_border,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: ListView(
          children: [
            const SizedBox(height: 12.0),
            // Hero(
            //   tag: "sdf",
            //   child: Container(
            //     height: 220.0,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(15.0),
            //       image: DecorationImage(
            //         image: NetworkImage(image.toString()),
            //         fit: BoxFit.fill,
            //       ),
            //     ),
            //   ),
            // ),
            const SizedBox(height: 15.0),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 15.0,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      //  color: kGrey3,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const CircleAvatar(
                        radius: 5.0,
                        // backgroundColor: kGrey3,
                      ),
                      const SizedBox(width: 6.0),
                      Text(
                        "Car Relevant News",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Color(0xFF6D6D6D),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Status(
                  icon: Icons.remove_red_eye,
                  total: "1view",
                ),
                const SizedBox(width: 15.0),
                Status(
                  icon: Icons.favorite_border,
                  total: "Like",
                ),
              ],
            ),
            SizedBox(height: 12.0),
            Text(
              "$title",
              style: TextStyle(
                fontSize: 18.0,
                color: Color(0xFF1C1C1C),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15.0),
            // Row(
            //   // ignore: prefer_const_literals_to_create_immutables
            //   children: [
            //     Text(
            //       "Date:",
            //       style: TextStyle(
            //         fontSize: 14.0,
            //         color: Color(0xFF6D6D6D),
            //       ),
            //     ),
            //     SizedBox(width: 5.0),
            //     SizedBox(
            //       width: 10.0,
            //       child: const Divider(
            //         //    color: kBlack,
            //         height: 1.0,
            //       ),
            //     ),
            //     SizedBox(width: 5.0),
            //     Text(
            //       "$datetime",
            //       style: TextStyle(
            //         fontSize: 14.0,
            //         //color: Color(0xFF6D6D6D),
            //       ).copyWith(color: Colors.black),
            //     ),
            //   ],
            // ),
            SizedBox(height: 15.0),
            Text(
              "Article: ",
              style: TextStyle(
                fontSize: 18.0,
                height: 2.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 25.0)
          ],
        ),
      ),
    );
  }
}

class Status extends StatelessWidget {
  final IconData? icon;
  final String? total;
  const Status({this.icon, this.total});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          //  color: kGrey2,
        ),
        SizedBox(width: 4.0),
        Text(
          total.toString(),
          // style: kDetailContent,
        ),
      ],
    );
  }
}
