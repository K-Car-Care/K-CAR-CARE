// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:k_car_care_project/constant/theme_constant.dart';
import 'package:k_car_care_project/screen/car_relevent_new_screen/car_relevent_news_screen.dart';
import 'package:k_car_care_project/screen/google_map_screen/find_garage_map_screen.dart';
import 'package:k_car_care_project/screen/drawer_screen/main_drawer.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:k_car_care_project/screen/history_screen.dart/main_history_screen.dart';
import 'package:k_car_care_project/screen/manage_expense_screen/manage_expense_screen.dart';
import 'package:k_car_care_project/screen/notification_screen/main_notification.dart';
import 'package:k_car_care_project/screen/profile_screen/main_profile_screen.dart';
import 'package:k_car_care_project/screen/service_screen/main_servce.dart';
import '../../data/check_connectivity/check_connectivity.dart';
import 'components/card_home_screen.dart';

class MyHomeScreenProd extends StatefulWidget {
  const MyHomeScreenProd({Key? key}) : super(key: key);

  @override
  _MyHomeScreenProdState createState() => _MyHomeScreenProdState();
}

class _MyHomeScreenProdState extends State<MyHomeScreenProd> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

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
      key: scaffoldKey,
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xff0185BE),
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              scaffoldKey.currentState!.openDrawer();
            },
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          title: Text('Overview', style: ThemeConstant.textTheme.bodyText1),
          actions: [
            IconButton(
              // ignore: prefer_const_constructors
              icon: (Icon(Icons.notifications, color: Colors.white)),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const Notifications()));
              },
            ),
          ]),
      body: CardWidget(),
    );
  }
}

class CardWidget extends StatelessWidget {
  List data = [
    {
      "color": const Color(0xffff6968),
      "image": 'assets/service_images/service.svg',
      "title": "Services",
      "desc": "Towing,Fuel,Flat Tire,Key Service",
    },
    {
      "color": const Color(0xff7a54ff),
      "image": 'assets/service_images/repairGarage.svg',
      "title": "Repair Garage",
      "desc": "Finding repair garage near you",
    },
    {
      "color": const Color(0xffff8f61),
      "image": 'assets/service_images/carRelevent.svg',
      "title": "Manage Expense",
      "desc": "repair cost estimate",
    },
    {
      "color": const Color(0xff2ac3ff),
      "image": 'assets/service_images/history.svg',
      "title": "Car Relevent news",
      "desc": "Send string to arduino robot via Bluetooth",
    },
    {
      "color": const Color(0xff5a65ff),
      "image": 'assets/service_images/account.svg',
      "title": "View History",
      "desc": "See all your history",
    },
    {
      "color": const Color(0xff96da45),
      "image": 'assets/service_images/service.svg',
      "title": "Account",
      "desc": "Your Profile",
    },
    {
      "color": const Color(0xffff6968),
      "image": 'assets/service_images/service.svg'
    },
    {
      "color": const Color(0xff7a54ff),
      "image": 'assets/service_images/service.svg'
    },
    {
      "color": const Color(0xffff8f61),
      "image": 'assets/service_images/service.svg'
    },
    {
      "color": const Color(0xff2ac3ff),
      "image": 'assets/service_images/service.svg'
    },
    {
      "color": const Color(0xff5a65ff),
      "image": 'assets/service_images/service.svg'
    },
    {
      "color": const Color(0xff96da45),
      "image": 'assets/service_images/service.svg'
    },
  ];

  final colorwhite = Colors.white;

  CardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: StaggeredGridView.countBuilder(
          physics: const BouncingScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 0.2,
          mainAxisSpacing: 0.5,
          itemCount: 6,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => {
                if (data[index]["title"] == "View History")
                  {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const HisstoryScreen())),
                  }
                else if (data[index]["title"] == "Services")
                  {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const ServiceScreen())),
                  }
                else if (data[index]["title"] == "Account")
                  {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const ProfileScreen())),
                  }
                else if (data[index]['title'] == "Repair Garage")
                  {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const GoogleMapScreen())),
                  }
                else if (data[index]['title'] == "Manage Expense")
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ManageExpenseScreen(),
                      ),
                    ),
                  }
                else if (data[index]['title'] == "Car Relevent news")
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const CarReleventNewsScreen(),
                      ),
                    ),
                  }
              },
              child: HomeCard(
                title: data[index]["title"],
                image: data[index]["image"],
                color: data[index]["color"],
                desc: data[index]["desc"],
              ),
            );
          },
          staggeredTileBuilder: (index) {
            return StaggeredTile.count(1, index.isEven ? 1.2 : 1.4);
          }),
      // );
    );
  }
}
