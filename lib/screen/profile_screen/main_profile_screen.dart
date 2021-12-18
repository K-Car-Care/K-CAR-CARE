// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors, avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_car_care_project/constant/theme_constant.dart';
import 'package:k_car_care_project/model/user_info_model.dart';
import 'package:k_car_care_project/screen/profile_screen/add_more_info_screen.dart';
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

  _getRecenProfileFromSharedPrefsFolder() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> _prevList = prefs.getStringList("recents") ?? [];
    setState(() {
      _recentProfile = _prevList;
      print(_recentProfile);
    });
  }

  @override
  void initState() {
    super.initState();
    _getRecenProfileFromSharedPrefsFolder();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: _recentProfile.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: _recentProfile.length,
                  itemBuilder: (context, index) {
                    final itemProfile = json.decode(_recentProfile[index]);
                    return Column(
                      children: [
                        StackContainer(
                          fullName: itemProfile['userName'] != null
                              ? '${itemProfile['userName']}'
                              : "User Guest",
                          profileImage: itemProfile['profile'] != null
                              ? itemProfile['profile'].toString()
                              : "https://cdn-icons-png.flaticon.com/512/149/149071.png",
                          cover:
                              "https://images.perthnow.com.au/publication/C-861981/e4fe792eca190bb10a6456b13046ade92f3764f7-4x3-x0y0w664h500.jpg",
                          role: "Member ship",
                        ),
                        CardItem(
                          subtitle: itemProfile['gmail'] != null
                              ? '${itemProfile['gmail']}'
                              : "topautotcam@gmail.com",
                          icon: Icon(
                            Icons.email,
                          ),
                          title: "Gmail",
                        ),
                        itemProfile['phone'] != null
                            ? CardItem(
                                subtitle: itemProfile['gmail'] != null
                                    ? '${itemProfile['gmail']}'
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
                              IconButton(
                                splashColor: Color(0xFF2196F3).withOpacity(.25),
                                onPressed: () { 
                                  Get.to(
                                    () => AddMoreInfoScreen(
                                      image: itemProfile['profile'].toString(),
                                    ),
                                  );
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
                )
              : SizedBox(
                  child: Center(
                    child: Text("Empty"),
                  ),
                ),
        ),
      ),
    );
  }
}
