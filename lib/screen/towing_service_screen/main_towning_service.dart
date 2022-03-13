// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:k_car_care_project/core/constant/theme_constant.dart';
import 'package:k_car_care_project/core/model/main_services_models/towing_model.dart';

import 'package:k_car_care_project/widget/reuse_card_service.dart';

import '../../core/data/check_connectivity/check_connectivity.dart';
import '../../core/data/towing_service_api.dart';

class TowingServiceScreen extends StatefulWidget {
  const TowingServiceScreen({Key? key}) : super(key: key);

  @override
  _TowingServiceScreenState createState() => _TowingServiceScreenState();
}

class _TowingServiceScreenState extends State<TowingServiceScreen> {
  Future<TowingServiceModel>? _towingModel;
  final TowingServiceApi _towingServiceApi = TowingServiceApi();

  @override
  void initState() {
    CheckInternet().checkConnection(context);
    _towingModel = _towingServiceApi.readTowingService();
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
        backgroundColor:defaultColor,
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
        title: Text('Towing Service', style: ThemeConstant.textTheme.bodyText1),
        actions: [
          IconButton(
            icon: (Icon(Icons.notifications, color: Colors.white)),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(5),
        child: FutureBuilder<TowingServiceModel>(
          future: _towingModel,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Error read data"),
              );
            }
            if (snapshot.hasData) {
              var result = snapshot.data!.payload;
              return ListView.builder(
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
    );
  }
}
