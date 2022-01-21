// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print, prefer_final_fields
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:k_car_care_project/constant/theme_constant.dart';

import 'package:k_car_care_project/screen/profile_screen/components/textfield_item.dart';
import 'package:k_car_care_project/screen/profile_screen/main_profile_screen.dart';
import 'package:k_car_care_project/storage_data/user_profile_storage/store_care_information.dart';

class AddMoreInfoScreen extends StatefulWidget {
  const AddMoreInfoScreen({Key? key}) : super(key: key);

  @override
  _AddMoreInfoScreenState createState() => _AddMoreInfoScreenState();
}

class _AddMoreInfoScreenState extends State<AddMoreInfoScreen> {
  TextEditingController? yearcontroller;
  TextEditingController? makeController;
  TextEditingController? modelController;
  TextEditingController? colorController;
  TextEditingController? carTypeController;
  String? year = 'One Thousand';

  List<String?> years = ['2002', ' 2004', ' 2006'];

  XFile? imageFile;
  final ImagePicker _imagePicker = ImagePicker();
  StoreCarInformation _storeCarInfo = StoreCarInformation();

  @override
  void initState() {
    super.initState();
    yearcontroller = TextEditingController();
    makeController = TextEditingController();
    carTypeController = TextEditingController();
    modelController = TextEditingController();
    colorController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: ThemeConstant.lightScheme.background,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: const Color(0xff0185BE),
          leading: IconButton(
            onPressed: () {
              Get.off(() =>ProfileScreen());
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          title: Text(
            "Add Information",
            style: ThemeConstant.textTheme.headline6!.copyWith(
              color: Colors.white,
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
                  height: MediaQuery.of(context).size.height * .04,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Please input correct information",
                    style: ThemeConstant.textTheme.headline6!.copyWith(
                      color: ThemeConstant.lightScheme.onBackground,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFieldItem(
                  textEditingController: yearcontroller,
                  title: "Year",
                  hint: "2022",
                ),
                TextFieldItem(
                  textEditingController: makeController,
                  title: "Make",
                  hint: "Toyota",
                ),
                TextFieldItem(
                  textEditingController: modelController,
                  title: "Model",
                  hint: "2022 Toyota... ",
                ),
                TextFieldItem(
                  textEditingController: colorController,
                  title: "Color",
                  hint: "Black",
                ),
                TextFieldItem(
                  textEditingController: carTypeController,
                  title: "CarType",
                  hint: "Van/Minivan",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * .3,
                      width: MediaQuery.of(context).size.width * .5,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                      ),
                      child: imageFile == null
                          ? Image.asset(
                              "assets/service_images/gallery_image.png")
                          : Image.file(
                              File(imageFile!.path),
                              fit: BoxFit.fill,
                            ),
                    ),
                    TextButton(
                      onPressed: () async {
                        await _getImage();
                      },
                      child: Text(
                        "Add Image",
                        style: ThemeConstant.textTheme.headline6!.copyWith(
                          color: ThemeConstant.lightScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 60,
                ),
                ElevatedButton(
                  onPressed: () {
                    _storeCarInfo.carstorageInfo(
                      year: yearcontroller?.text,
                      make: makeController?.text,
                      model: modelController?.text,
                      color: colorController?.text,
                      cartype: carTypeController?.text,
                    );
                    Get.offAll(() => ProfileScreen());
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 140,
                    height: 50,
                    child:
                        Text("Add", style: ThemeConstant.textTheme.subtitle1),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _getImage() async {
    final XFile? selectimage =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    print(selectimage!.path);
    setState(
      () {
        imageFile = selectimage;
      },
    );
  }
}
