import 'package:flutter/material.dart';
import 'package:k_car_care_project/core/constant/app_images.dart';
import 'package:k_car_care_project/screen/drawer_screen/main_drawer.dart';
import 'package:k_car_care_project/screen/google_map_screen/find_garage_map_screen.dart';
import 'package:k_car_care_project/screen/notification_screen/main_notification.dart';
import '../../core/model/home_screen_model/home_screen_model.dart';
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

  List<String> carouselImage =[
    AppImages.sliderImg1,
    AppImages.sliderImg2,
    AppImages.sliderImg3,
    AppImages.sliderImg4,
    AppImages.sliderImg5,
    AppImages.sliderImg6
  ];

  // ignore: prefer_final_fields
  List<MainModel> _mainBox = [
    MainModel( name: 'VIEW HISTORY', image: AppImages.historyImg,color:const Color(0xFFff0066)),
    MainModel(name: 'REPAIR COST', image: AppImages.repairCostImg,color:const Color(0xFFfea832)),
    MainModel(name: 'CAR RELVENT NEW',image: AppImages.carReleventNews,color:const  Color(0xFFB00020)),
    MainModel(name: 'ACCOUNT', image:AppImages.profileImg,color:const Color(0xFF0F3EB6)),
    MainModel(name: 'CAR SERVICE', image: AppImages.carServiceImg, color:const  Color(0xFF1976D2)),
    MainModel( name: 'REPAIR SERVICE', image: AppImages.repairService,color:Colors.green),
  ];
  
  navigate(int index) {
    if (_mainBox[index].name.toUpperCase() == "car service".toUpperCase()) {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const ServiceScreen()));
    } else if (_mainBox[index].name.toUpperCase() ==
        "REPAIR SERVICE".toUpperCase()) {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const GoogleMapScreen())
    );
    } else if (_mainBox[index].name.toUpperCase() ==
        "repair cost".toUpperCase()) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const ManageExpenseScreen(),
          ),
        );
    } else if (_mainBox[index].name.toUpperCase() == "CAR RELVENT NEW".toUpperCase()) {
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
      drawer: const NavigationDrawerWidget(),
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
                  color: Color(0xfffaca0b),
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
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (_) => const Notifications()));
              },
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
              items: carouselImage.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image:AssetImage(i),
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
              dotsCount: carouselImage.isEmpty ? 3 : carouselImage.length,
              dotPosition: dotPosition.toDouble(),
            ),
            // const SizedBox(
            //   height: 20,
            // ),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(
                _mainBox.length,
                (index) => InkWell(
                  onTap: () {
                    navigate(index);
                  },
                  child: BBoxWidget(
                    color:_mainBox[index].color,
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
