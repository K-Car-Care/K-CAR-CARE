// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:k_car_care_project/data/car_relevent_news_api.dart';
import 'package:k_car_care_project/model/car_relevent_news_models/car_relevent_news_model.dart';

import '../../constant/theme_constant.dart';
import '../../widget/reuse_card_service.dart';

class CarReleventNewsScreen extends StatefulWidget {
  const CarReleventNewsScreen({Key? key}) : super(key: key);

  @override
  State<CarReleventNewsScreen> createState() => _CarReleventNewsScreenState();
}

class _CarReleventNewsScreenState extends State<CarReleventNewsScreen> {
  Future<CarReleventNewsModel>? _carReleventNews;
  final CarReleventNewsApi _carReleventNewsApi = CarReleventNewsApi();

  @override
  void initState() {
    _carReleventNews = _carReleventNewsApi.readCarReleventNewsApi();
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
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          title: Text('Car Relevent News',
              style: ThemeConstant.textTheme.bodyText1),
          actions: [
            IconButton(
              icon: (Icon(Icons.notifications, color: Colors.white)),
              onPressed: () {},
            ),
          ]),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: FutureBuilder<CarReleventNewsModel>(
            future: _carReleventNews,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text("Try again"),
                );
              }
              if (snapshot.hasData) {
                var carReleventNews = snapshot.data!.payload;
                return ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: carReleventNews!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CardService(
                        color: ColorRandom.getRandomColor(),
                        icon: carReleventNews[index].newsId!.img.toString(),
                        desc:
                            carReleventNews[index].newsId!.message.toString(),
                        title: carReleventNews[index].newsId!.title.toString(),
                        phoneNumber: 'May 03, 2021',
                      );
                    });
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}
