// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors, avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:k_car_care_project/core/constant/theme_constant.dart';
import 'package:k_car_care_project/core/storage_data/user_profile_storage/save_user_data.dart';
import 'package:k_car_care_project/screen/profile_screen/add_more_info_screen.dart';
import 'package:k_car_care_project/screen/profile_screen/edit_user_profile_screen.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../core/data/check_connectivity/check_connectivity.dart';
import '../../core/data/user_profile_api.dart';
import 'components/card_item_profile.dart';
import 'components/stack_container.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<String> _recentProfile = [];
  // ignore: unused_field
  List<String> _carStoreInfo = [];
  String? userLocation = 'Get Your Current Lcoation';
  Position? position;
  List<Placemark>? placeMarks;
  _getRecenProfileFromSharedPrefsFolder() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> _prevList = prefs.getStringList("recents") ?? [];
    List<String> _carList = prefs.getStringList('carStore') ?? [];
    String? currentLocation = prefs.getString("userlocation");

    setState(() {
      _carStoreInfo = _carList;
      userLocation = currentLocation;
      _recentProfile = _prevList;
    });
  }

  final SaveUserData _saveUserData = SaveUserData();
  final UserProfileApi _api = UserProfileApi();
  @override
  void initState() {
    _api.readTowingService();
    super.initState();
    CheckInternet().checkConnection(context);
    _getRecenProfileFromSharedPrefsFolder();
  }

  @override
  void dispose() {
    CheckInternet().listener?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: 
          // Container(
          //           height:MediaQuery.of(context).size.height,
          //           child: ListView.builder(
          //               physics: NeverScrollableScrollPhysics(),
          //               shrinkWrap: true,
          //               itemCount: _carStoreInfo.length,
          //               itemBuilder: (context, index) {
          //                 var _itemList = json.decode(_carStoreInfo[index]);
          //                 print(_itemList.toString());
          //                 return CardItem(
          //                   subtitle: _itemList['make'],
          //                   icon: Icon(
          //                     Icons.car_rental,
          //                   ),
          //                   title: _itemList['year'],
          //                 );
          //               }),
          //         ),
          
          ListView.builder(
            shrinkWrap: true,
            itemCount: _recentProfile.length,
            itemBuilder: (context, index) {
              final itemProfile = json.decode(_recentProfile[index]);
              print(_recentProfile[index]);
              return Column(
                children: [
                  StackContainer(
                    fullName: itemProfile['username'] != "User Guest"
                        ? '${itemProfile['username']}'
                        : "User Guest",
                    profileImage: itemProfile['profileUrl'] != ""
                        ? itemProfile['profileUrl'].toString()
                        : "https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png",
                    cover:
                        "https://images.perthnow.com.au/publication/C-861981/e4fe792eca190bb10a6456b13046ade92f3764f7-4x3-x0y0w664h500.jpg",
                    role: "Member ship",
                  ),
                  IconButton(
                    onPressed: () {
                      Get.to(() => EditUserProfileScreen());
                    },
                    icon: Icon(Icons.edit),
                  ),
                  itemProfile['gmail'] != ""
                      ? CardItem(
                          subtitle: itemProfile['gmail'] != ""
                              ? '${itemProfile['gmail']}'
                              : "topautotcam@gmail.com",
                          icon: Icon(
                            Icons.email,
                          ),
                          title: "Gmail",
                        )
                      : SizedBox(),
                  itemProfile['phone'] != ""
                      ? InkWell(
                          onTap: () {
                            Get.to(() => EditUserProfileScreen());
                          },
                          child: CardItem(
                            subtitle: itemProfile['phone'] != ""
                                ? '${itemProfile['phone']}'
                                : "សូមបញ្ជូលលេខទូរស័ព្ទរបស់លោកអ្នក",
                            icon: Icon(
                              Icons.phone,
                            ),
                            title: "Phone Number",
                          ),
                        )
                      : SizedBox(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 14,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Add Your Location",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        IconButton(
                          splashColor: Color(0xFF2196F3).withOpacity(.25),
                          onPressed: () {
                            getCurrentLocation();
                          },
                          icon: Icon(
                            Icons.add,
                            color: ThemeConstant.lightScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  CardItem(
                    subtitle: userLocation.toString(),
                    icon: Icon(
                      Icons.gps_fixed,
                    ),
                    title: "Current Location",
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 14,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Add Car Information",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        IconButton(
                          splashColor: Color(0xFF2196F3).withOpacity(.25),
                          onPressed: () {
                            Get.to(() => AddMoreInfoScreen());
                          },
                          icon: Icon(
                            Icons.add,
                            color: ThemeConstant.lightScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Container(
                  //   height:MediaQuery.of(context).size.height,
                  //   child: ListView.builder(
                  //       physics: NeverScrollableScrollPhysics(),
                  //       shrinkWrap: true,
                  //       itemCount: _carStoreInfo.length,
                  //       itemBuilder: (context, index) {
                  //         var _itemList = json.decode(_carStoreInfo[index]);
                  //         print(_itemList.toString());
                  //         return CardItem(
                  //           subtitle: _itemList['make'],
                  //           icon: Icon(
                  //             Icons.car_rental,
                  //           ),
                  //           title: _itemList['year'],
                  //         );
                  //       }),
                  // )
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Future getCurrentLocation() async {
    Position newPosition = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    position = newPosition;
    placeMarks = await placemarkFromCoordinates(
      position!.latitude,
      position!.longitude,
    );
    Placemark pMark = placeMarks![0];

    String completeAddress = '${pMark.subThoroughfare} ${pMark.thoroughfare}, ${pMark.subLocality} ${pMark.locality},${pMark.subAdministrativeArea},${pMark.administrativeArea}, ${pMark.postalCode} ${pMark.country}';

    setState(() {
      userLocation = completeAddress;
    });
    _saveUserData.saveUserLocation(location: userLocation);
    print(userLocation);
  }
}
