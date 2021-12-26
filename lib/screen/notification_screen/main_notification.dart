import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_car_care_project/constant/theme_constant.dart';
import 'package:k_car_care_project/model/notification_model.dart';
import 'package:k_car_care_project/screen/notification_screen/detail_notification_screen.dart';
import 'components/card_notification.dart';
import 'empty_screen.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications>
    with SingleTickerProviderStateMixin {
  List<Notificationss> notificationList = [
    const Notificationss(
        title: "របៀបបង្កើតគណនីសម្រាប់សាលាគម្ពីរ?",
        desc: "សាលា គម្ពីរជាវេទិកានិម្មិត សម្រាប់សិស្សានុសិស្ស គ្រូបង្រៀន   "),
    const Notificationss(
        title: "តើធ្វើម្ដេចទើបខ្ញុំអាចបង្កើតសាលាបាន?",
        desc: "សាលា គម្ពីរជាវេទិកានិម្មិត សម្រាប់សិស្សានុសិស្ស គ្រូបង្រៀន   "),
    const Notificationss(
        title: "របៀបបង្កើតគណនីសម្រាប់សាលាគម្ពីរ?",
        desc: "សាលា គម្ពីរជាវេទិកានិម្មិត សម្រាប់សិស្សានុសិស្ស គ្រូបង្រៀន   "),
    const Notificationss(
        title: "ការប្រើប្រាស់សាលាគម្ពីរលើកដំបូង!",
        desc: "សាលា គម្ពីរជាវេទិកានិម្មិត សម្រាប់សិស្សានុសិស្ស គ្រូបង្រៀន   "),
    const Notificationss(
        title: "តើធ្វើម្ដេចទើបខ្ញុំអាចបង្កើតមេរៀនបាន?",
        desc: "សាលា គម្ពីរជាវេទិកានិម្មិត សម្រាប់សិស្សានុសិស្ស គ្រូបង្រៀន  "),
    const Notificationss(
        title: "ការកំណត់ទូរទៅ!",
        desc: "សាលា គម្ពីរជាវេទិកានិម្មិត សម្រាប់សិស្សានុសិស្ស គ្រូបង្រៀន   "),
    const Notificationss(
        title: "ការប្រើប្រាស់សាលាគម្ពីរលើកដំបូង!",
        desc: "សាលា គម្ពីរជាវេទិកានិម្មិត សម្រាប់សិស្សានុសិស្ស គ្រូបង្រៀន   "),
    const Notificationss(
        title: "តើធ្វើម្ដេចទើបខ្ញុំអាចបង្កើតមេរៀនបាន?",
        desc: "សាលា គម្ពីរជាវេទិកានិម្មិត សម្រាប់សិស្សានុសិស្ស គ្រូបង្រៀន  "),
    const Notificationss(
        title: "ការកំណត់ទូរទៅ!",
        desc: "សាលា គម្ពីរជាវេទិកានិម្មិត សម្រាប់សិស្សានុសិស្ស គ្រូបង្រៀន   "),
  ];

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
              //Go  Back
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          title:
              Text('Notifications', style: ThemeConstant.textTheme.bodyText1),
          actions: [
            IconButton(
              // ignore: prefer_const_constructors
              icon: (Icon(Icons.notifications, color: Colors.white)),
              onPressed: () {},
            ),
          ]),
      body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: notificationList.length,
          itemBuilder: (BuildContext context, int index) {
            if (notificationList.isEmpty) {
              return const NotificationsEmpty();
            }
            return InkWell(
              onTap: () {
               // Get.to(() => ReadNewsView());
              },
              child: CardNotification(
                isLoading: false,
                title: notificationList[index].title,
                date: '10-july-2021 | 10:00 am',
                textBody: notificationList[index].desc,
              ),
            );
          }),
    );
  }
}
