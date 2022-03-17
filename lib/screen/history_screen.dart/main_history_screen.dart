// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';

import '../../constant/theme_constant.dart';
import '../../data/check_connectivity/check_connectivity.dart';

class HisstoryScreen extends StatefulWidget {
  const HisstoryScreen({Key? key}) : super(key: key);

  @override
  _HisstoryScreenState createState() => _HisstoryScreenState();
}

class _HisstoryScreenState extends State<HisstoryScreen> {
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
      appBar: AppBar(
          elevation: 0,
          backgroundColor: defaultColor,
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          title: Text('History', style: ThemeConstant.textTheme.bodyText1),
          actions: [
            IconButton(
              // ignore: prefer_const_constructors
              icon: (Icon(Icons.notifications, color: Colors.white)),
              onPressed: () {},
            ),
          ]),
   
    );
  }
}
