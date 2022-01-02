import 'package:flutter/material.dart';
import 'package:k_car_care_project/constant/theme_constant.dart';

class CardService extends StatelessWidget {
  final Color color;
  final String icon;
  final String title;
  final String phoneNumber;
  final String desc;
  const CardService({
    Key? key,
    required this.color,
    required this.icon,
    required this.title,
    required this.phoneNumber,
    required this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListTile(
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color,
              // border: Border.all(width: 0.5, color: Colors.grey.withOpacity(0.5)),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Image.network(
                icon,
                fit: BoxFit.fill,
                
                // color: Colors.white,
              ),
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: Text(desc,
                //'#248, Preah Monivong Blvd. (Street 93), Sangkat Boeung Raing, Khan Daun. Penh, Phnom Penh, Cambodia.',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: ThemeConstant.textTheme.bodyText2!
                    .copyWith(color: Colors.grey)),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
                  //'Fast Towing',
                  style: ThemeConstant.textTheme.bodyText1!.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w500)),
              Text(phoneNumber,
                  //'017 238 008',
                  style: ThemeConstant.textTheme.bodyText2!
                      .copyWith(color: color)),
            ],
          ),
        ),
      ),
    );
  }
}
