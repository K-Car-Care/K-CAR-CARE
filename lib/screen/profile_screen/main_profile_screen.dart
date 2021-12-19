// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors, avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:k_car_care_project/constant/theme_constant.dart';
import 'package:k_car_care_project/helpers/save_user_data.dart';
import 'package:k_car_care_project/model/user_info_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/card_item_profile.dart';
import 'components/stack_container.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<UserInfos> notificationList = [
    const UserInfos(
      icon: Icon(Icons.email_outlined),
      title: 'user@gmail.com',
      subtitle: 'Email',
    ),
    const UserInfos(
        icon: Icon(Icons.email_outlined),
        title: '017 238 008',
        subtitle: 'Phone Number')
  ];
  List<String> _recentProfile = [];
  String? userLocation = 'Get Your Current Lcoation';
  Position? position;
  List<Placemark>? placeMarks;
  _getRecenProfileFromSharedPrefsFolder() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> _prevList = prefs.getStringList("recents") ?? [];
    String? currentLocation = prefs.getString("userlocation");

    setState(() {
      userLocation = currentLocation;
      _recentProfile = _prevList;
      print(_recentProfile);
    });
  }

  final SaveUserData _saveUserData = SaveUserData();
  @override
  void initState() {
    super.initState();
    _getRecenProfileFromSharedPrefsFolder();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _recentProfile.length,
            itemBuilder: (context, index) {
              final itemProfile = json.decode(_recentProfile[index]);
              return Column(
                children: [
                  StackContainer(
                    fullName: itemProfile['userName'] != ""
                        ? '${itemProfile['userName']}'
                        : "User Guest",
                    profileImage: itemProfile['profile'] != ""
                        ? itemProfile['profile'].toString()
                        : "https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png",
                    cover:
                        "https://images.perthnow.com.au/publication/C-861981/e4fe792eca190bb10a6456b13046ade92f3764f7-4x3-x0y0w664h500.jpg",
                    role: "Member ship",
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
                      ? CardItem(
                          subtitle: itemProfile['phoneNumber'] != ""
                              ? '${itemProfile['phoneNumber']}'
                              : "សូមបញ្ជូលលេខទូរស័ព្ទរបស់លោកអ្នក",
                          icon: Icon(
                            Icons.phone,
                          ),
                          title: "Phone Number",
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
                        userLocation == "Get Your Current Lcoation"
                            ? IconButton(
                                splashColor: Color(0xFF2196F3).withOpacity(.25),
                                onPressed: ()  {
                                  
                                },
                                icon: Icon(
                                  Icons.add,
                                  color: ThemeConstant.lightScheme.primary,
                                ),
                              )
                            : SizedBox(),
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
                          onPressed: () async {
                            await getCurrentLocation();
                          },
                          icon: Icon(
                            Icons.add,
                            color: ThemeConstant.lightScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
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

    String completeAddress =
        '${pMark.subThoroughfare} ${pMark.thoroughfare}, ${pMark.subLocality} ${pMark.locality},${pMark.subAdministrativeArea},${pMark.administrativeArea}, ${pMark.postalCode} ${pMark.country}';

    setState(() {
      userLocation = completeAddress;
    });
    _saveUserData.saveUserLocation(location: userLocation);
    print(userLocation);
  }
}
