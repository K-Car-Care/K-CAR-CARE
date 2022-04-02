// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:k_car_care_project/core/data/car_relevent_news_api.dart';
// import 'package:k_car_care_project/data/car_relevent_news_api.dart';
import 'package:k_car_care_project/core/model/car_relevent_news_models/car_relevent_news_model.dart';
import 'package:k_car_care_project/core/shared/typography.dart';
import '../../core/constant/theme_constant.dart';
import '../test.dart';

class CarReleventNewsScreen extends StatefulWidget {
  const CarReleventNewsScreen({Key? key}) : super(key: key);

  @override
  State<CarReleventNewsScreen> createState() => _CarReleventNewsScreenState();
}

class _CarReleventNewsScreenState extends State<CarReleventNewsScreen> {
  Future<CarReleventNewsModel>? _carReleventNews;
  CarReleventNewsApi carReleventNewsApi = CarReleventNewsApi();

  @override
  void initState() {
    _carReleventNews = carReleventNewsApi.readCarReleventNewsApi();
    super.initState();
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
          title: Text('Car Relevent News',
              style: subTitleTextStyleWhite.copyWith(fontWeight: FontWeight.w600)
          ),
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
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Stack(
                            children: <Widget>[
                              ClipRRect(
                                child: CachedNetworkImage(
                                  imageUrl: 'https://img.indianautosblog.com/crop/480x360/2022/03/15/2022-toyota-glanza-front-left-31e7.jpg',
                                  height: 192.0,
                                  width:  MediaQuery.of(context).size.width,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Platform.isAndroid
                                      ? CircularProgressIndicator()
                                      : CircularProgressIndicator(),
                                  errorWidget: (context, url, error) => Image.asset(
                                    'assets/images/img_not_found.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  // if (await canLaunch(itemArticle.url)) {
                                  //   await launch(itemArticle.url);
                                  // } else {
                                  //   scaffoldState.currentState.showSnackBar(SnackBar(
                                  //     content: Text('Could not launch news'),
                                  //   ));
                                  // }
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 192.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.black.withOpacity(0.8),
                                        Colors.black.withOpacity(0.0),
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      stops: const [
                                        0.0,
                                        0.7,
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 12.0,
                                      top: 12.0,
                                      right: 12.0,
                                    ),
                                    child:  Text(
                                      // title,
                                      'Car Relevent news',
                                      maxLines:2,
                                      style: ThemeConstant.textTheme.bodyText1!.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 12.0,
                                      top: 4.0,
                                      right: 12.0,
                                    ),
                                    child: Wrap(
                                      children: <Widget>[
                                        Icon(
                                          Icons.date_range_outlined,
                                          color: Colors.white.withOpacity(0.8),
                                          size: 12.0,
                                        ),
                                        SizedBox(width: 4.0),
                                        Text(
                                          '30/03/2022',
                                          style: TextStyle(
                                            color: Colors.white.withOpacity(0.8),
                                            fontSize: 11.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                      ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: carReleventNews!.length,
                          itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap:(){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ReadNewsView(news: recentList[index]),
                                ),
                              );
                            },
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: ListTile(
                                  contentPadding: const EdgeInsets.all(3),
                                  leading: Container(
                                    width: 80,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: ColorRandom.getRandomColor(),
                                      // border: Border.all(width: 0.5, color: Colors.grey.withOpacity(0.5)),
                                      // shape: BoxShape.circle,
                                      shape:BoxShape.rectangle,
                                      //  image: new DecorationImage(
                                      //   image: new AssetImage(AppImages.carServiceImg),
                                      //   fit: BoxFit.cover,
                                      // ),
                                      image: DecorationImage(
                                        image: NetworkImage('https://pbs.twimg.com/media/FEZnzWQVUAYMyQk.jpg'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 3),
                                    child: Column(
                                      children: [
                                        Text(
                                          // desc,
                                          'Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: ThemeConstant.textTheme.bodyText2!.copyWith(color: Colors.grey)
                                        ),
                                        // const SizedBox(height: 10),   
                                      ],
                                    ),
                                  ),
                                  title: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        // title,
                                        'Car Relevent news',
                                        style: ThemeConstant.textTheme.bodyText1!.copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      
                                      // InkWell(
                                      //   onTap: () async {
                                          // final url = 'tel:$phoneNumber';
                                          // if (await canLaunch(url)) {
                                          //   await launch(url);
                                          // }
                                      //   },
                                      //   child: Text(
                                      //     phoneNumber,
                                      //     style: ThemeConstant.textTheme.bodyText2!.copyWith(
                                      //       color: color,
                                      //     ),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                          }),
                    ],
                  ),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}
