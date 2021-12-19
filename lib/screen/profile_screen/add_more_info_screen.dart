import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:k_car_care_project/constant/theme_constant.dart';

class AddMoreInfoScreen extends StatefulWidget {
  final String image;
  const AddMoreInfoScreen({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  _AddMoreInfoScreenState createState() => _AddMoreInfoScreenState();
}

class _AddMoreInfoScreenState extends State<AddMoreInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          // ignore: prefer_const_constructors
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Edit Information",
          style: ThemeConstant.textTheme.headline6!.copyWith(
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .06,
              ),
              const CircleAvatar(
                radius: 60,
              ),
              const SizedBox(
                height: 20,
              ),
              // ignore: prefer_const_constructors
              Align(
                alignment: Alignment.topLeft,
                child: const Text("User Information"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
