import 'package:flutter/material.dart';
import 'package:k_car_care_project/constant/theme_constant.dart';
import 'package:k_car_care_project/model/main_services_models.dart/fuel_model.dart';
import 'package:k_car_care_project/services/fuel_service_api.dart';
import 'package:k_car_care_project/widget/reuse_card_service.dart';

class FuelServiceScreen extends StatefulWidget {
  const FuelServiceScreen({Key? key}) : super(key: key);

  @override
  _FuelServiceScreenState createState() => _FuelServiceScreenState();
}

class _FuelServiceScreenState extends State<FuelServiceScreen> {
  Future<FuelService>? _fuelService;
  final FuelServiceApi _fuelServiceApi = FuelServiceApi();
  @override
  void initState() {
    _fuelService = _fuelServiceApi.readFuelService();
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
        title: Text('Fuel Service', style: ThemeConstant.textTheme.bodyText1),
        actions: [
          IconButton(
            // ignore: prefer_const_constructors
            icon: (Icon(Icons.notifications, color: Colors.white)),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: FutureBuilder<FuelService>(
          future: _fuelService,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text("Error read data from fuel service"),
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
