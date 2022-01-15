// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:k_car_care_project/constant/theme_constant.dart';
import 'package:k_car_care_project/model/main_services_models.dart/key_service_model.dart';
import 'package:k_car_care_project/services/check_connectivity/check_connectivity.dart';
import 'package:k_car_care_project/services/key_service_api.dart';
import 'package:k_car_care_project/widget/reuse_card_service.dart';

class KeyServiceScreen extends StatefulWidget {
  const KeyServiceScreen({Key? key}) : super(key: key);

  @override
  _KeyServiceScreenState createState() => _KeyServiceScreenState();
}

class _KeyServiceScreenState extends State<KeyServiceScreen> {
  Future<KeyServiceModel>? _keyServicemodel;
  final KeyServiceApi _keyServiceApi = KeyServiceApi();
  @override
  void initState() {
    CheckInternet().checkConnection(context);
    _keyServicemodel = _keyServiceApi.readKeyService();
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
          title: Text('key Service', style: ThemeConstant.textTheme.bodyText1),
          actions: [
            IconButton(
              icon: (Icon(Icons.notifications, color: Colors.white)),
              onPressed: () {},
            ),
          ]),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: FutureBuilder<KeyServiceModel>(
            future: _keyServicemodel,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text("Error while read data from api key service"),
                );
              }
              if (snapshot.hasData) {
                var result = snapshot.data!.payload;
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: result?.length,
                  itemBuilder: (BuildContext context, int index) {
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
              return Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}
