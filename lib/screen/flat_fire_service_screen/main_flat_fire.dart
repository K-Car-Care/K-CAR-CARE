import 'package:flutter/material.dart';
import 'package:k_car_care_project/constant/theme_constant.dart';
import 'package:k_car_care_project/model/main_services_models/flate_model.dart';
import 'package:k_car_care_project/widget/reuse_card_service.dart';

import '../../data/check_connectivity/check_connectivity.dart';
import '../../data/flate_service_api.dart';

class FlatFireServiceScreen extends StatefulWidget {
  const FlatFireServiceScreen({Key? key}) : super(key: key);

  @override
  _FlatFireServiceScreenState createState() => _FlatFireServiceScreenState();
}

class _FlatFireServiceScreenState extends State<FlatFireServiceScreen> {
  Future<FlateTireServiceModel>? _flateTireModel;
  final FlateTireServiceApi _flateTireServiceApi = FlateTireServiceApi();

  @override
  void initState() {
    CheckInternet().checkConnection(context);
    _flateTireModel = _flateTireServiceApi.readFlateServiceApi();
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
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          title: Text('Flat Tire Service',
              style: ThemeConstant.textTheme.bodyText1),
          actions: [
            IconButton(
              // ignore: prefer_const_constructors
              icon: (Icon(Icons.notifications, color: Colors.white)),
              onPressed: () {},
            ),
          ]),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: FutureBuilder<FlateTireServiceModel>(
          future: _flateTireModel,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text(
                    "Error while read data from api in Flate Tire Service"),
              );
            }

            if (snapshot.hasData) {
              var result = snapshot.data!.payload;
              return ListView.builder(
                itemCount: result?.length,
                itemBuilder: (context, index) {
                  return CardService(
                    color: const Color(0xffff6968),
                    icon: result![index].img.toString(),
                    desc: result[index].location.toString(),
                    title: result[index].name.toString(),
                    phoneNumber: result[index].phone.toString(),
                  );
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
