import 'package:flutter/material.dart';
import 'package:k_car_care_project/constant/theme_constant.dart';

class CardItem extends StatelessWidget {
  final Widget icon;
  final String subtitle;
  final String title;
  const CardItem({
    Key? key,
    required this.subtitle,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 21.0,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconButton(
                onPressed: () {},
                icon: icon,
              ),
              SizedBox(width: 24.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    title,
                    style: ThemeConstant.textTheme.bodyText1!
                        .copyWith(color: Colors.black),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    subtitle,
                    style: ThemeConstant.textTheme.bodyText2!
                        .copyWith(color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
