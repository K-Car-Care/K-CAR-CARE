// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:k_car_care_project/core/constant/theme_constant.dart';
import 'package:k_car_care_project/core/model/main_services_models/towing_model.dart';
import 'package:k_car_care_project/core/shared/typography.dart';

import 'package:k_car_care_project/widget/reuse_card_service.dart';

import '../../core/data/check_connectivity/check_connectivity.dart';
import '../../core/data/towing_service_api.dart';

class TowingServiceScreen extends StatefulWidget {
  const TowingServiceScreen({Key? key}) : super(key: key);

  @override
  _TowingServiceScreenState createState() => _TowingServiceScreenState();
}

class _TowingServiceScreenState extends State<TowingServiceScreen>  with TickerProviderStateMixin{
  Future<TowingServiceModel>? towingModel;
  final TowingServiceApi _towingServiceApi = TowingServiceApi();
  
  TabController? _tabController;
  int tabIndex = 0;
  AnimationController? controller;

  @override
  void initState() {
    CheckInternet().checkConnection(context);
    towingModel = _towingServiceApi.readTowingService();
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat();
    init();
  }

    init() async {
    _tabController = TabController(vsync: this, initialIndex: tabIndex, length:3);
  }


  @override
  void dispose() {
    CheckInternet().listener?.cancel();
    _tabController?.dispose();
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>  [
               SliverAppBar(
                leading: IconButton(
                  onPressed: () {
                    //Go  Back
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                title: Text('All Services of Towing',style: titleTextStyleBlack.copyWith(),),
                bottom: TabBar(
                  // indicator: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(50), // Creates border
                  //   color: Colors.grey,
                  // ),
                  unselectedLabelColor: Colors.black,
                  controller: _tabController,
                  indicatorColor: defaultColor,
                  labelColor: defaultColor,
                  indicatorSize: TabBarIndicatorSize.label,
                  labelStyle: subTitleTextStyleBlack.copyWith(fontWeight: FontWeight.w600),
                  isScrollable: true, 
                tabs: const [
                  Tab(
                    text:'All',
                  ),
                  Tab(
                    text: 'Service1',
                  ),
                  Tab(
                    text: 'Service2',
                  ),
                ]),
              ),
            ];
          },
          body:TabBarView(
            controller:_tabController,
            children: [
               Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(5),
        child: FutureBuilder<TowingServiceModel>(
          future: towingModel,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text("Error read data"),
                );
              }
              if (snapshot.hasData) {
                var result = snapshot.data!.payload;
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: result?.length,
                  itemBuilder: (context, index) {
                    return CardService(
                      color: Color(0xffff6968),
                      icon: result![index].img.toString(),
                      desc: result[index].location.toString(),
                      title: result[index].name.toString(),
                      phoneNumber: result[index].phone.toString(),
                    );
                  },
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
              Container(
                height: 200,
                color: Colors.red,
              ),
              Container(
                height: 200,
                color: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     elevation: 0,
    //     backgroundColor:defaultColor,
    //     automaticallyImplyLeading: false,
    //     leading: IconButton(
    //       onPressed: () {
    //         Navigator.pop(context);
    //       },
    //       icon: const Icon(
    //         Icons.arrow_back,
    //         color: Colors.white,
    //       ),
    //     ),
    //     centerTitle: true,
    //     title: Text('Towing Service', style: subTitleTextStyleWhite.copyWith(fontWeight: FontWeight.w600)),
    //     actions: [
    //       IconButton(
    //         icon: (Icon(Icons.notifications, color: Colors.white)),
    //         onPressed: () {},
    //       ),
    //     ],
    //   ),
      // body: Container(
      //   height: MediaQuery.of(context).size.height,
      //   padding: const EdgeInsets.all(5),
      //   child: FutureBuilder<TowingServiceModel>(
      //     future: _towingModel,
      //     builder: (context, snapshot) {
      //       if (snapshot.hasError) {
      //         return Center(
      //           child: Text("Error read data"),
      //         );
      //       }
      //       if (snapshot.hasData) {
      //         var result = snapshot.data!.payload;
      //         return ListView.builder(
      //           itemCount: result?.length,
      //           itemBuilder: (context, index) {
      //             return CardService(
      //               color: Color(0xffff6968),
      //               icon: result![index].img.toString(),
      //               desc: result[index].location.toString(),
      //               title: result[index].name.toString(),
      //               phoneNumber: result[index].phone.toString(),
      //             );
      //           },
      //         );
      //       }
      //       return Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     },
      //   ),
      // ),
    // );
  }
}
