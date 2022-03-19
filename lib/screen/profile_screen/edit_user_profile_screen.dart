// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print, unused_element
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:k_car_care_project/constant/theme_constant.dart';
import 'package:k_car_care_project/screen/profile_screen/components/textfield_item.dart';
import 'package:k_car_care_project/storage_data/user_profile_storage/user_phone_number_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditUserProfileScreen extends StatefulWidget {
  const EditUserProfileScreen({Key? key}) : super(key: key);

  @override
  _EditUserProfileScreenState createState() => _EditUserProfileScreenState();
}

class _EditUserProfileScreenState extends State<EditUserProfileScreen> {
  TextEditingController? phoneController;
  TextEditingController? makeController;
  TextEditingController? modelController;
  TextEditingController? colorController;
  TextEditingController? carTypeController;

  XFile? imageFile;
  final ImagePicker _imagePicker = ImagePicker();
  late String phoneNumber;
  final PhonenumberStorage _storage = PhonenumberStorage();

  @override
  void initState() {
    phoneNumber = '';
    super.initState();
    phoneController = TextEditingController();
    makeController = TextEditingController();
    carTypeController = TextEditingController();
    modelController = TextEditingController();
    colorController = TextEditingController();
  }

  void getPhoneNumber() async {
    try {
      SharedPreferences _pref = await SharedPreferences.getInstance();
      phoneNumber = _pref.getString('phoneNum') ?? "";
    } catch (e) {}
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
              Get.back();
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
                  height: 20,
                ),
                TextFieldItem(
                  textEditingController: phoneController,
                  title: "Phone Number",
                  hint: "+855-0000",
                  validate: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your phone number";
                    } else if (value.length <= 7 && value.length >= 9) {
                      return "Phone number have only 8-digit";
                    }
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    print(phoneController!.text.toString());
                    var phoneNumber = phoneController!.text.trim().toString();
                    if (phoneNumber.isEmpty) {
                    } else if (phoneNumber.length <= 7 &&
                        phoneNumber.length >= 9) {
                    } else {
                      _storage.phoneStorage(phoneNumber);
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 140,
                    height: 50,
                    child: Text("Update",
                        style: ThemeConstant.textTheme.subtitle1),
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
