// ignore_for_file: prefer_const_constructors
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:k_car_care_project/apis/towing_service_api.dart';
import 'package:k_car_care_project/constant/theme_constant.dart';
import 'package:k_car_care_project/model/main_services_models.dart/towing_model.dart';
import 'package:k_car_care_project/widget/reuse_card_service.dart';

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
    _towingModel = _towingServiceApi.readTowingService();
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
        padding: const EdgeInsets.symmetric(horizontal: 10),
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
