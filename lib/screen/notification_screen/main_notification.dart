// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:k_car_care_project/constant/theme_constant.dart';
import 'package:k_car_care_project/data/notification_api/notification_api.dart';

import 'package:k_car_care_project/screen/notification_screen/detail_notification_screen.dart';
import '../../data/check_connectivity/check_connectivity.dart';
import '../../model/notification_models/notification_model.dart';
import 'components/card_notification.dart';
import 'empty_screen.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications>
    with SingleTickerProviderStateMixin {
  final NotificationApi _notiApi = NotificationApi();
  Future<NotificationModel>? _notiModel;

  @override
  initState() {
    CheckInternet().checkConnection(context);
    _notiModel = _notiApi.readNotificationApi();
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
        title: Text('Notifications', style: ThemeConstant.textTheme.bodyText1),
      ),
      body: FutureBuilder<NotificationModel>(
          future: _notiModel,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text("Try again"),
              );
            }
            if (snapshot.hasData) {
              var notificationList = snapshot.data!.payload;
              //  print(notificationList);
              return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: notificationList?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        var day =
                            notificationList?[index].newsId!.createdAt!.day;
                        var month =
                            notificationList?[index].newsId!.createdAt!.month;
                        var year =
                            notificationList?[index].newsId!.createdAt!.year;

                        Get.to(() => DetailNotificationScreen(
                              title: notificationList?[index].newsId!.title,
                              image: notificationList?[index].newsId!.img,
                              desc: notificationList?[index].newsId!.message,
                              datetime: "$day - $month - $year",
                            ));
                      },
                      child: CardNotification(
                        isLoading: false,
                        image: Image.network(
                            notificationList![index].newsId!.img.toString()),
                        title: notificationList[index].newsId!.title.toString(),
                        date: '10-july-2021 | 10:00 am',
                        textBody:
                            notificationList[index].newsId!.message.toString(),
                      ),
                    );
                  });
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
