// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:k_car_care_project/constant/theme_constant.dart';

class CardNotification extends StatelessWidget {
  final String title;
  final String date;
  final String textBody;
  final bool isLoading;
  final Image image;
  const CardNotification(
      {Key? key,
      required this.title,
      required this.date,
      required this.textBody,
      required this.image,
      required this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            // border: Border.all(width: 0.5, color: Colors.grey.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: ListTile(
                leading: SizedBox(
                  width: 40,
                  height: 40,
                  child: Center(
                    child:image,
                  ),
                ),
                title: Text(title,
                    style: ThemeConstant.textTheme.bodyText1!
                        .copyWith(color: Colors.black)),
                subtitle: Text(date,
                    style: ThemeConstant.textTheme.bodyText2!
                        .copyWith(color: Colors.grey)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 17, right: 17, bottom: 10),
              child: Text(textBody,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: ThemeConstant.textTheme.bodyText1!
                      .copyWith(color: Colors.grey)),
            ),
          ],
        ),
      ),
    );
  }
}
