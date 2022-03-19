// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:k_car_care_project/constant/theme_constant.dart';

class TextFieldItem extends StatelessWidget {
  final String? hint;
  final String? title;
  final TextEditingController? textEditingController;
  final FormFieldValidator<String>? validate;
  const TextFieldItem({
    Key? key,
    this.hint,
    this.title,
    this.textEditingController,
    this.validate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      //  mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title ?? "",
          style: ThemeConstant.textTheme.headline6!.copyWith(
            color: ThemeConstant.lightScheme.onBackground,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
            controller: textEditingController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              isDense: true,
              contentPadding: EdgeInsets.all(18.0),
              // labelText: hint,
              hintText: hint,
            ),
            validator: validate),
        SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
