// ignore_for_file: prefer_const_constructors, avoid_print, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:k_car_care_project/core/constant/theme_constant.dart';
import 'package:k_car_care_project/core/shared/typography.dart';
import 'package:k_car_care_project/screen/drawer_screen/main_drawer.dart';

class NewTransaction extends StatelessWidget {
  const NewTransaction({Key? key, this.opacity, this.done}) : super(key: key);
  final double? opacity;
  final VoidCallback? done;

  @override
  Widget build(BuildContext context){
    return AnimatedContainer(
      height: MediaQuery.of(context).size.height / 3.2,
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
      width: double.infinity,
      padding: EdgeInsets.all(16),
      color: Colors.white.withOpacity(opacity!),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const SizedBox(height: 5),
          BuildLineTop(context: context),
          SizedBox(height: 10),
          const Text(
            "Add New Expense",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: black
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            // readOnly: true,
            // initialValue: 'App Subscription',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              hintText: 'Title',
              hintStyle: bodyTextStyleBlack.copyWith(fontWeight:FontWeight.w400,color:grey),
              isDense: true,
              labelText: 'Title',
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.all(12),
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  // inputFormatters: [WhiteI .digitsOnly,],
                  decoration: InputDecoration(
                    hintText: 'Amount',
                    hintStyle: bodyTextStyleBlack.copyWith(fontWeight:FontWeight.w400,color:grey),
                    icon: Icon(Icons.attach_money),
                    isDense: true,
                    contentPadding: EdgeInsets.all(8),
                  ),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Service',
                    hintStyle: bodyTextStyleBlack.copyWith(fontWeight:FontWeight.w400,color:grey),
                    icon: Icon(Icons.work),
                    isDense: true,
                    contentPadding: EdgeInsets.all(8),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlineButton.icon(
                borderSide: BorderSide(width: 1, color: Colors.black),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                onPressed: () {
                  print('Hello');
                },
                icon: Icon(Icons.today,color:grey),
                label: Text(
                  DateFormat('MMM dd, yyyy').format(DateTime.now()),
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400,color:grey),
                ),
              ),
              RaisedButton.icon(
                color: defaultColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                onPressed: done,
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                label: Text(
                  "Add",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}