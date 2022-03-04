// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_car_care_project/constant/theme_constant.dart';
import 'package:k_car_care_project/screen/home_screen/home_screen.dart';
import 'package:k_car_care_project/widget/reuse_card_service.dart';

import '../../data/check_connectivity/check_connectivity.dart';

class HisstoryScreen extends StatefulWidget {
  const HisstoryScreen({Key? key}) : super(key: key);

  @override
  _HisstoryScreenState createState() => _HisstoryScreenState();
}

class _HisstoryScreenState extends State<HisstoryScreen> {
  @override
  void initState() {
    CheckInternet().checkConnection(context);
    super.initState();
  }

  @override
  void dispose() {
    CheckInternet().listener?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xff0185BE),
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          title: Text('History', style: ThemeConstant.textTheme.bodyText1),
          actions: [
            IconButton(
              // ignore: prefer_const_constructors
              icon: (Icon(Icons.notifications, color: Colors.white)),
              onPressed: () {},
            ),
          ]),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GestureDetector(
          onVerticalDragStart: (details) => {
           // print(details),
          },
          onVerticalDragEnd: (velocity) {
          //  var sinat = velocity;
          //  print(sinat);
          },
          child: Container(
            width: 200,
            height: 200,
            color: Colors.black,
          ),
        ),
        // child: ListView.builder(
        //     physics: const BouncingScrollPhysics(),
        //     itemCount: 10,
        //     itemBuilder: (BuildContext context, int index) {
        //       return CardService(
        //         color: ColorRandom.getRandomColor(),
        //         icon: 'assets/service_images/service_icon.png',
        //         desc:
        //             'Find history icon stock images in HD and millions of other royalty-free stock photos',
        //         title: 'TELA  POWER',
        //         phoneNumber: 'May 03, 2021',
        //       );
        //     }),
      ),
    );
  }
}
