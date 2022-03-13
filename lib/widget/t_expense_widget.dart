// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:k_car_care_project/core/constant/theme_constant.dart';

class TExpenseWidget extends StatelessWidget {
  final DecorationImage? image;
  final String? title;
  final String? subtitle;
  final String? price;
  final Widget? editIcon;
  final Widget? deleteIcon;
  final Function()? onTapEdit;
  final Function()? onTapDelete;

  const TExpenseWidget({
    Key? key,
    this.image,
    this.title,
    this.subtitle,
    this.price,
    this.editIcon,
    this.deleteIcon,
    this.onTapEdit,
    this.onTapDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 100,
                width: 90,
                decoration: BoxDecoration(
                  image: image,
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title ?? "No Title",
                    style: ThemeConstant.textTheme.headline6!.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    subtitle ?? "No Description",
                    style: ThemeConstant.textTheme.headline6!.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    color: Color(0xff0F3EB6),
                    child: Text(
                      price ?? "\$0.00",
                      style: ThemeConstant.textTheme.subtitle2!.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: onTapEdit,
                icon: Icon(
                  Icons.edit,
                  size: 20,
                  color: Color(0xff0F3EB6),
                ),
              ),
              IconButton(
                onPressed: onTapDelete,
                icon: Icon(
                  Icons.delete_outline,
                  size: 20,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
