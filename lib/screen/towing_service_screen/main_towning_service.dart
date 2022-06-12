// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:k_car_care_project/core/constant/theme_constant.dart';
import 'package:k_car_care_project/core/model/garage_by_service_model.dart';
import 'package:k_car_care_project/core/model/main_services_models/towing_model.dart';
import 'package:k_car_care_project/core/shared/typography.dart';

import 'package:k_car_care_project/widget/reuse_card_service.dart';

import '../../core/data/check_connectivity/check_connectivity.dart';
import '../../core/data/main_service_api.dart';
import '../../core/data/towing_service_api.dart';
import '../../core/model/service_by_main_sevice_model.dart';

class TowingServiceScreen extends StatefulWidget {
  final String? mainService;
  const TowingServiceScreen({
    Key? key,
    required this.mainService,
  }) : super(key: key);

  @override
  _TowingServiceScreenState createState() => _TowingServiceScreenState();
}

class _TowingServiceScreenState extends State<TowingServiceScreen>  with TickerProviderStateMixin{
  Future<TowingServiceModel>? towingModel;
  final TowingServiceApi _towingServiceApi = TowingServiceApi();
  final MainServiceApi _serviceApi = MainServiceApi();
  
  TabController? _tabController;
  int tabIndex = 0;
  AnimationController? controller;
  List<Services>? readServiceBYMainServiceApi;
  ServiceByMainService? data;
  List<DataGarage>? garageByService;
  GarageByService? data1,data2;

  String? serviceId;
  

  @override
  void initState() {
    initList();
    CheckInternet().checkConnection(context);
    towingModel = _towingServiceApi.readTowingService();
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat();
  }

  void initList() async{
    //garageByService  = (await _serviceApi.readGarageBYServiceApi()) as List<GarageByService>?;
    data = await _serviceApi.readServiceBYMainServiceApi(mainId: '61d12fc85f43ee2041d576ec');
    data1 = await _serviceApi.readGarageBYServiceApi(byId:serviceId== null ? ''  :'serviceId=$serviceId');
    garageByService =  data1!.payload; 
    readServiceBYMainServiceApi = data!.payload?[0].services;
    setState(() {
      serviceId = readServiceBYMainServiceApi![0].sId;
    });
  }

  init() async {
    _tabController = TabController(vsync: this, initialIndex: tabIndex, length:readServiceBYMainServiceApi!.length);
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
    if(readServiceBYMainServiceApi == null){
      return Container(
        color: Colors.white,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return DefaultTabController(
      length: readServiceBYMainServiceApi!.length,
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
                title: Text('All Services of ${widget.mainService}',style: titleTextStyleBlack.copyWith(),),
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
                onTap: (value) {
                },
                tabs: List<Widget>.generate(
                    readServiceBYMainServiceApi!.length,
                    (int index) {
                      return SizedBox(
                        child: Tab(
                          child: Text(readServiceBYMainServiceApi![index].name == readServiceBYMainServiceApi![0].name ?'All' :readServiceBYMainServiceApi![index].name??''),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ];
          },
          body:TabBarView(
            controller:_tabController,
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.all(5),
                child:ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: garageByService!.length,
                  itemBuilder: (context, index){
                    return CardService(
                      color: Color(0xffff6968),
                      icon: garageByService![index].garage?.logo??'',
                      desc: garageByService![index].garage?.location ??'',
                      title: garageByService![index].garage?.name??'',
                      phoneNumber: garageByService![index].garage?.phone??'',
                      price: garageByService![index].price,
                    );
                  },
                )
              ),
              ShowGarageByService(
                serviceId: readServiceBYMainServiceApi![0].sId ??'',
              ),
              ShowGarageByService(
                serviceId: readServiceBYMainServiceApi![1].sId ??'',
              ),
              ShowGarageByService(
                serviceId: readServiceBYMainServiceApi![2].sId ??'',
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

class ShowGarageByService extends StatefulWidget {
  const ShowGarageByService({
    Key? key,
    required this.serviceId,
  }) : super(key: key);

  final String serviceId;

  @override
  State<ShowGarageByService> createState() => _ShowGarageByServiceState();
}

class _ShowGarageByServiceState extends State<ShowGarageByService> {

  List<DataGarage>? garageByService;
  GarageByService? data1,data2;
  final MainServiceApi _serviceApi = MainServiceApi();
  

  @override
  // ignore: must_call_super
  void initState() {
    initList();
    CheckInternet().checkConnection(context);
  }

  void initList() async{
    data1 = await _serviceApi.readGarageBYServiceApi(byId:'serviceId=${widget.serviceId}');
    garageByService =  data1!.payload; 
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    if(garageByService == null){
      return Container(
        color: Colors.white,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.all(5),
      child:ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: garageByService!.length,
        itemBuilder: (context, index) {
          return CardService(
            color: Color(0xffff6968),
            icon:garageByService![index].garage?.logo??'',
            desc: garageByService![index].garage?.location ??'',
            title: garageByService![index].garage?.name??'',
            phoneNumber:garageByService![index].garage?.phone??'',
            price: garageByService![index].price,
          );
        },
      )
    );
  }
}
