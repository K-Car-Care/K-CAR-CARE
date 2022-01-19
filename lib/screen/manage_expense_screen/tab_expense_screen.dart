// ignore_for_file: prefer_const_constructors, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_car_care_project/screen/manage_expense_screen/edit_option_screen/edit_option_screen.dart';
import 'package:k_car_care_project/widget/t_expense_widget.dart';

class TabExpenseScreen extends StatelessWidget {
  const TabExpenseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      //  color: Colors.black,
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => Divider(
          color: Colors.black,
        ),
        itemCount: 20,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.all(8.0),
          child: TExpenseWidget(
            onTapEdit: () {
              Get.to(() => EditOptionScreen());
            },
            onTapDelete: () {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text("Are you sure?"),
                  content: Text("You have raised a Alert Dialog Box"),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Text(
                        "No",
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Text("Yes"),
                    ),
                  ],
                ),
              );
            },
            image: DecorationImage(
              image: NetworkImage(
                "http://marchforsciencenorway.com/wp-content/uploads/2020/12/s-l-n-s-towing-service-tumkur-car-towing-services-cjn1zdvk41.jpg",
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
