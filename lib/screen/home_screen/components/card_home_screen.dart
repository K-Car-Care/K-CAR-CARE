import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:k_car_care_project/constant/theme_constant.dart';

class HomeCard extends StatelessWidget {
  final String title;
  final String image;
  final String desc;
  final Color color;
  const HomeCard({
    Key? key,
    required this.title,
    required this.color,
    required this.desc,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: color, width: 1)),
        // shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            children: [
              ListTile(
                title: Text(title,
                    style: ThemeConstant.textTheme.bodyText1!.copyWith(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600)),
                subtitle: Text(
                  desc,
                  maxLines: 2,
                  overflow: TextOverflow.fade,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              Container(
                  color: color.withOpacity(0.5),
                  alignment: Alignment.bottomRight,
                  // padding: const EdgeInsets.only(right: 10, top: 15),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SvgPicture.asset(
                      image,
                      width: 50,
                      height: 37,
                      color: Colors.white,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
