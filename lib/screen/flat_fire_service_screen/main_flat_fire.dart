import 'package:flutter/material.dart';
import 'package:k_car_care_project/constant/theme_constant.dart';
import 'package:k_car_care_project/widget/reuse_card_service.dart';

class FlatFireServiceScreen extends StatefulWidget {
  const FlatFireServiceScreen({Key? key}) : super(key: key);

  @override
  _FlatFireServiceScreenState createState() => _FlatFireServiceScreenState();
}

class _FlatFireServiceScreenState extends State<FlatFireServiceScreen> {
  @override
  void initState() {
    super.initState();
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
          title: Text('Flat Tire Service',
              style: ThemeConstant.textTheme.bodyText1),
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
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return const CardService(
                color: Color(0xffff8f61),
                icon: 'assets/service_images/service_icon.png',
                desc:
                    '#248, Preah Monivong Blvd. (Street 93), Sangkat Boeung Raing, Khan Daun. Penh, Phnom Penh, Cambodia.',
                title: 'Fast Towing',
                phoneNumber: '017 238 008',
              );
            }),
      ),
    );
  }
}
