import 'package:flutter/material.dart';
import 'package:k_car_care_project/model/user_info_model.dart';

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
        subtitle: 'Email'),
    const UserInfos(
        icon: Icon(Icons.email_outlined),
        title: '017 238 008',
        subtitle: 'Phone Number')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const StackContainer(
              cover:
                  "https://images.perthnow.com.au/publication/C-861981/e4fe792eca190bb10a6456b13046ade92f3764f7-4x3-x0y0w664h500.jpg",
              profileImage:
                  "https://www.pngall.com/wp-content/uploads/5/Profile-Avatar-PNG.png",
              fullName: "Neecoder X",
              role: "Developer",
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => CardItem(
                icon: notificationList[index].icon,
                title: notificationList[index].title,
                subtitle: notificationList[index].subtitle,
              ),
              shrinkWrap: true,
              itemCount: notificationList.length,
            )
          ],
        ),
      ),
    );
  }
}
