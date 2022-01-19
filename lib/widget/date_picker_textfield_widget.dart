// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:k_car_care_project/constant/theme_constant.dart';

class TPickerTextField extends StatelessWidget {
  final String? hint;
  final String? title;
  final TextEditingController? textEditingController;
  final Widget? leading;
  const TPickerTextField({
    Key? key,
    this.hint,
    this.title,
    this.textEditingController,
    this.leading,
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
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(
                    2000), //DateTime.now() - not to allow to choose before today.
                lastDate: DateTime(2101),);
          },
          readOnly: true,
          controller: textEditingController,
          decoration: InputDecoration(
            prefixIcon: leading,
            border: OutlineInputBorder(),
            isDense: true,
            contentPadding: EdgeInsets.all(18.0),
            // labelText: hint,
            hintText: hint,
          ),
        ),
        SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
