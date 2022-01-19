// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_car_care_project/constant/theme_constant.dart';
import 'package:k_car_care_project/screen/manage_expense_screen/expense_list_screen.dart';
import 'package:k_car_care_project/screen/profile_screen/components/textfield_item.dart';
import 'package:k_car_care_project/widget/date_picker_textfield_widget.dart';

class AddExpenseDataScreen extends StatelessWidget {
  const AddExpenseDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {
              Get.off(
                () => const ExpenseListScreen(),
              );
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: Text(
            "Add Expense",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          actions: [
            InkWell(
              onTap: () {
                print("save");
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      "Save",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        color: Color(
                          0xff0F3EB6,
                        ),
                        decoration: TextDecoration.underline,
                        decorationColor: Color(
                          0xff0F3EB6,
                        ),
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(
                      Icons.check_circle_outline,
                      color: Color(
                        0xff0F3EB6,
                      ),
                      size: 18,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 10,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 4,
                        color: Colors.black.withOpacity(.2),
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: Colors.grey.withOpacity(.2),
                    ),
                  ),
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      SizedBox(
                        child: TextFieldItem(
                          hint: "Input your expense...",
                        ),
                      ),
                      SizedBox(
                        child: TextFieldItem(
                          hint: "Input your price...",
                        ),
                      ),
                      SizedBox(
                        child: TPickerTextField(
                          leading: Icon(
                            Icons.date_range,
                            size: 26,
                          ),
                          hint: "Enter Date...",
                        ),
                      ),
                      SizedBox(
                        child: TextFieldItem(
                          hint: "Note...",
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
