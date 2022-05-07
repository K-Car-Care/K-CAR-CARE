// ignore_for_file: avoid_print, unrelated_type_equality_checks

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:k_car_care_project/core/constant/app_images.dart';
import 'package:k_car_care_project/core/constant/theme_constant.dart';
import 'package:k_car_care_project/core/model/main_services_models/main_model.dart';
import 'package:k_car_care_project/screen/flat_fire_service_screen/main_flat_fire.dart';
import 'package:k_car_care_project/screen/fuel_service_screen/main_fuel_service.dart';
import 'package:k_car_care_project/screen/key_service_screen/main_key_service.dart';
import 'package:k_car_care_project/screen/towing_service_screen/main_towning_service.dart';
import 'package:k_car_care_project/core/shared/typography.dart';
import 'package:k_car_care_project/widget/reuse_circle_image.dart';
import 'package:k_car_care_project/screen/service_screen/components/reuse_main_card_service.dart';
// import 'package:shared_preferences/shared_preferences.dart';

import '../../core/data/check_connectivity/check_connectivity.dart';
import '../../core/data/main_service_api.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({Key? key}) : super(key: key);

  @override
  _ServiceScreenState createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  Future<MainServiceModel>? _mainServiceModel;

  final MainServiceApi _serviceApi = MainServiceApi();

  CollectionReference users =
      FirebaseFirestore.instance.collection('user_phoneNumber');

  // List<String> _recentTranlates = [];
  // _getRecentsFromSharedPrefsFolder() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();

  //   List<String> _prevList = prefs.getStringList("recents") ?? [];
  //   setState(
  //     () {
  //       _recentTranlates = _prevList;
  //       print(_recentTranlates);
  //     },
  //   );
  // }

  @override
  void initState() {
    super.initState();
    // _getRecentsFromSharedPrefsFolder();
    fetchData();
    CheckInternet().checkConnection(context);
  }

  void fetchData() async{
    _mainServiceModel = _serviceApi.readMainServiceApi();
  }

  List data = [
    {
      "color": const Color(0xff2ac3ff),
      "image": 'assets/service_images/towing.png',
      "title": "TOWING",
    },
    {
      "color": const Color(0xffff6968),
      "image": 'assets/service_images/maki_fuel.png',
      "title": "FUEL",
    },
    {
      "color": const Color(0xff7a54ff),
      "image": 'assets/service_images/key_car.png',
      "title": "KEY SERVICE",
    },
    {
      "color": const Color(0xff96da45),
      "image": 'assets/service_images/flat_tire.png',
      "title": "FLAT TIRE",
    },
  ];

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
          backgroundColor: defaultColor,
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              //Go  Back
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          title: Text('Services', style: titleTextStyleWhite.copyWith(fontWeight: FontWeight.w600)),
          actions: [
            IconButton(
              // ignore: prefer_const_constructors
              icon: (Icon(Icons.notifications, color: Colors.white)),
              onPressed: () async {},
            ),
          ]),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: FutureBuilder<MainServiceModel>(
          future: _mainServiceModel,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.toString()),
              );
            }
            if (snapshot.hasData) {
              var result = snapshot.data!.payload;
              return SizedBox(
                // height: MediaQuery.of(context).size.height - 30,
                // padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: snapshot.data!.payload!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    // crossAxisSpacing: 10
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        if (result![index].name?.toUpperCase() ==
                            "TOWING") {
                          Get.to(() => const TowingServiceScreen());
                        } else if (result[index].name?.toUpperCase() ==
                            "FUEL") {
                          Get.to(() => const FuelServiceScreen());
                        } else if (result[index].name?.toUpperCase() ==
                            "KEY SERVICE") {
                          Get.to(() => const KeyServiceScreen());
                        } else if (result[index].name?.toUpperCase() ==
                            "FLATE TIRE") {
                          Get.to(() => const FlatFireServiceScreen());
                        }
                      },
                      child: MainCardService(
                        title: "${result?[index].name}",
                        image: "${result?[index].img.toString()}",
                        // color: data[index]['color'],
                      ),
                    );
                  },
                ),
              );
            }
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 180,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ),
    );
  }
}
