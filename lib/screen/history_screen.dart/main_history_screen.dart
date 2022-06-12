// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:k_car_care_project/core/constant/app_images.dart';
// import 'package:get/get.dart';
import 'package:k_car_care_project/core/constant/theme_constant.dart';
import 'package:k_car_care_project/core/shared/typography.dart';
// import 'package:k_car_care_project/screen/home_screen/home_screen.dart';
// import 'package:k_car_care_project/widget/reuse_card_service.dart';

import '../../core/data/check_connectivity/check_connectivity.dart';

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
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: Text('History', style: titleTextStyleBlack.copyWith(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            // ignore: prefer_const_constructors
            icon: (Icon(Icons.notifications, color: Colors.white)),
            onPressed: () {},
          ),
        ]
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
            padding: const EdgeInsets.all(5),
            physics: const BouncingScrollPhysics(),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              // return CardService(
              //   color: ColorRandom.getRandomColor(),
              //   icon: 'assets/service_images/service_icon.png',
              //   desc:'Find history icon stock images in HD and millions of other royalty-free stock photos',
              //   title: 'TELA  POWER',
              //   phoneNumber: 'May 03, 2021',
              // );
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 0.5,
                    color:Colors.grey.withOpacity(0.3)),
                  borderRadius:BorderRadius.circular(8),
                ),
                margin: const EdgeInsets.symmetric(vertical: 3,horizontal: 2),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(5),
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color:  ColorRandom.getRandomColor(),
                        shape:BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Image.asset(
                        AppImages.historyIcon,
                        fit: BoxFit.fill,
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: Column(
                        children: [
                          Text(
                            // desc,
                            '#248, Preah Monivong Blvd. (Street 93), Sangkat Boeung Raing, Khan Daun.',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: bodyTextStyleBlack.copyWith(color:grey)
                          ),
                          const SizedBox(height: 10),    
                        ],
                      ),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:const[
                        Text(
                          // title,
                          'TOP AUTO Repair',
                          style: TextStyle(fontWeight: FontWeight.w600)
                        ),
                      ],
                    ),
                  ),
                ),
              ); 
            }
        ),
      ),
    );
  }
}
