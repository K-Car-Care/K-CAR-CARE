import 'package:flutter/material.dart';
import 'package:k_car_care_project/constant/theme_constant.dart';

class NotificationsEmpty extends StatefulWidget {
  const NotificationsEmpty({Key? key}) : super(key: key);

  @override
  _NotificationsEmptyState createState() => _NotificationsEmptyState();
}

class _NotificationsEmptyState extends State<NotificationsEmpty>
    with SingleTickerProviderStateMixin {
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
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Image.asset('assets/service_images/notification_empty.png',
                fit: BoxFit.fill),
          ),
          Text("មិនទាន់មានសារជូនដំណឹងនៅឡើយទេ!",
              style: ThemeConstant.textTheme.bodyText1!
                  .copyWith(color: Colors.grey)),
        ],
      )),
    );
  }
}
