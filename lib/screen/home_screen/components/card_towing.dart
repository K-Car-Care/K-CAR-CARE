
import 'package:flutter/material.dart';
import 'package:k_car_care_project/core/constant/theme_constant.dart';
import 'package:k_car_care_project/core/shared/typography.dart';

class StylistCard extends StatelessWidget {
  final String? url;
  final String? title;
  final VoidCallback? onTap;
  const StylistCard({Key? key, this.url, this.title, this.onTap}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 4 - 20,
      decoration: BoxDecoration(
        border: Border.all(width: 0.5,color: grey.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(5),
        color: white
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 10,
            right: 10,
            child: Image.network(
              url!,
              width: 100,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title!,
                  style:titleTextStyleBlack.copyWith(fontWeight: FontWeight.w600)
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Best Service',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.star,
                      size: 16,
                      color: defaultColor,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '5.0',
                      style: TextStyle(
                        color: Color(0xff4E295B),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  onPressed: onTap,
                  color: defaultColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    'Find',
                    style: subTitleTextStyleBlack.copyWith(fontWeight: FontWeight.bold)
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}