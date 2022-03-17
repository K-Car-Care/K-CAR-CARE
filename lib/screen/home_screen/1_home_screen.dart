// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../../model/home_screen_model/home_screen_model.dart';
import '../../widget/b_box_widget.dart';
import '../../widget/carousel_widget.dart';
import '../../widget/dot_indicator_widget.dart';
import '../car_relevent_new_screen/car_relevent_news_screen.dart';
import '../history_screen.dart/main_history_screen.dart';
import '../manage_expense_screen/manage_expense_screen.dart';
import '../profile_screen/main_profile_screen.dart';
import '../service_screen/main_servce.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  // ignore: prefer_final_fields
  List<String> _carouselImage = [
    "https://cdn3.vectorstock.com/i/1000x1000/40/42/car-service-vector-3874042.jpg",
    "https://cdn3.vectorstock.com/i/1000x1000/40/42/car-service-vector-3874042.jpg",
    "https://cdn3.vectorstock.com/i/1000x1000/40/42/car-service-vector-3874042.jpg"
  ];

  // ignore: prefer_final_fields
  List<MainModel> _mainBox = [
    MainModel(
        name: 'CAR SERVICE', image: 'assets/service_images/service_icon.png'),
    MainModel(
        name: 'REPAIR SERVICE',
        image: 'assets/service_images/service_icon.png'),
    MainModel(
        name: 'REPAIR COST', image: 'assets/service_images/service_icon.png'),
    MainModel(
        name: 'CAR RELVENT NEW',
        image: 'assets/service_images/service_icon.png'),
    MainModel(
        name: 'VIEW HISTORY', image: 'assets/service_images/service_icon.png'),
    MainModel(name: 'ACCOUNT', image: 'assets/service_images/service_icon.png'),
  ];
  navigate(int index) {
    if (_mainBox[index].name.toUpperCase() == "car service".toUpperCase()) {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const ServiceScreen()));
    } else if (_mainBox[index].name.toUpperCase() ==
        "REPAIR SERVICE".toUpperCase()) {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const ServiceScreen()));
    } else if (_mainBox[index].name.toUpperCase() ==
        "repair cost".toUpperCase()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const ManageExpenseScreen(),
        ),
      );
    } else if (_mainBox[index].name.toUpperCase() ==
        "CAR RELVENT NEW".toUpperCase()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const CarReleventNewsScreen(),
        ),
      );
    } else if (_mainBox[index].name.toUpperCase() ==
        "VIEW HISTORY".toUpperCase()) {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const HisstoryScreen()));
    } else if (_mainBox[index].name.toUpperCase() == "account".toUpperCase()) {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const ProfileScreen()));
    }
  }

  var dotPosition = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: const Drawer(),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => _key.currentState!.openDrawer(),
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        title: RichText(
          text: const TextSpan(
            text: "Auto",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
            children: [
              TextSpan(
                text: "Care",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding:const EdgeInsets.symmetric(horizontal: 20),
            child: IconButton(
              onPressed: () {},
              icon:const Icon(
                Icons.notifications_none_outlined,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 15),
            CarouselWidget(
              onPageChanged: (val, carouselPageChangedReason) {
                setState(() {
                  dotPosition = val;
                });
              },
              items: _carouselImage.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(i),
                        ),
                        color: Colors.blue,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(
              height: 10,
            ),
            DotIndicatorWidget(
              dotsCount: _carouselImage.isEmpty ? 3 : _carouselImage.length,
              dotPosition: dotPosition.toDouble(),
            ),
            const SizedBox(
              height: 20,
            ),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              physics: const NeverScrollableScrollPhysics(),
              // ignore: prefer_const_literals_to_create_immutables
              children: List.generate(
                _mainBox.length,
                (index) => InkWell(
                  onTap: () {
                    navigate(index);
                  },
                  child: BBoxWidget(
                    tag: _mainBox[index].name.toUpperCase(),
                    name: _mainBox[index].name.toUpperCase(),
                    image: _mainBox[index].image.toString(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
