import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:k_car_care_project/core/constant/app_images.dart';
import 'package:k_car_care_project/core/constant/theme_constant.dart';
import 'package:k_car_care_project/core/shared/typography.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        elevation: 0,
        backgroundColor: defaultColor,
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
        title: Text('About Us',style: subTitleTextStyleWhite),
        actions: [
          IconButton(
            icon: (const Icon(Icons.notifications, color: Colors.white)),
            onPressed: () {},
          ),
        ]
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                child:  Image.asset(AppImages.logoImg, width: 100),
              ),
              const SizedBox(height: 7),
              Text(
                "SAVE MONEY ON YOUR CAR",
                textAlign: TextAlign.justify,
                style: bodyTextStyleBlack.copyWith(fontWeight: FontWeight.w600),
              ),
              Text(
                "We help you control FUEL, refuelling, MAINTENANCE and expenses (registration, fines and financing) and revenues. Drivvo is a finance manager for your CAR, MOTORCYCLE, BUS or TRUCK, for personal use or for professional drivers (Taxi, Uber, Cabify, 99, motorcycle couriers and truck drivers).Managing MULTIPLE VEHICLES and getting the gas consumption calculation just got a lot easier; get fuel efficiency reports sorted by fuel and gas stations, showing which one is best for your car.",
                textAlign: TextAlign.justify,
                style: bodyTextStyleBlack.copyWith(color:Colors.grey),
              ),
              Text(
                "You can also restore data from other apps.",
                textAlign: TextAlign.justify,
                style: bodyTextStyleBlack.copyWith(fontWeight: FontWeight.w600),
              ),
              Text(
                "(Fuelio, aCar, Carango, Carrorama, Fuel Log, My Cars, Car Expenses, Fuel Manager)",
                textAlign: TextAlign.justify,
                style: bodyTextStyleBlack.copyWith(color:Colors.grey),
              ),
              Text(
                "SAVE MONEY",
                textAlign: TextAlign.justify,
                style: bodyTextStyleBlack.copyWith(fontWeight: FontWeight.w600),
              ),
              Text(
                "Find out how much you spend on gasoline or ethanol, registration, fines and save much more. By registering refuelling, expenses and services with this app for your car, you will have access to its monthly costs, average consumption, cost per km, average km/liter, oil change and even instalments of its financing.With Drivvo, you will have a CAR APP at hand, helping with fuel calculation and management of preventive maintenance, therefore saving money. No more forgetting a maintenance, fine, taxes or financing instalments; leave aside the monthly expenses spreadsheet.)",
                textAlign: TextAlign.justify,
                style: bodyTextStyleBlack.copyWith(color:Colors.grey),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Supported and copyrighted by',
                style: subTitleTextStyleBlack.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Image.asset(AppImages.logoImg, height: 70),
                  ),
                  Expanded(
                    child:  Image.asset(AppImages.logoImg, height: 70),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
