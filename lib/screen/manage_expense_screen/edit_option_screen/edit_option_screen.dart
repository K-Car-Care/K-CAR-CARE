// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_car_care_project/core/constant/theme_constant.dart';
import 'package:k_car_care_project/screen/profile_screen/components/textfield_item.dart';
class EditOptionScreen extends StatefulWidget {
  const EditOptionScreen({Key? key}) : super(key: key);

  @override
  _EditOptionScreenState createState() => _EditOptionScreenState();
}

class _EditOptionScreenState extends State<EditOptionScreen> {
  TextEditingController? yearcontroller;
  TextEditingController? makeController;
  TextEditingController? modelController;
  TextEditingController? colorController;
  TextEditingController? carTypeController;
  @override
  void initState() {
    super.initState();
    yearcontroller = TextEditingController();
    makeController = TextEditingController();
    carTypeController = TextEditingController();

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
                  height: 10,
                ),
                TextFieldItem(
                  textEditingController: yearcontroller,
                  title: "Title",
                  hint: "Input your problem here",
                ),
                TextFieldItem(
                  textEditingController: makeController,
                  title: "Description",
                  hint: "Input your detail information",
                ),
                TextFieldItem(
                  textEditingController: modelController,
                  title: "price",
                  hint: "\$00",
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
                     
                    ),
                    TextButton(
                      onPressed: () async {
                       
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

}
