import 'package:flutter/material.dart';
import 'package:k_car_care_project/core/constant/theme_constant.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Please selete service related to your problem . If you need additional help or unsure of services needed, Please contact our customer service team.',
          textAlign: TextAlign.justify,
          style:
              ThemeConstant.textTheme.bodyText1!.copyWith(color: Colors.white),
        ),
        Positioned(
          bottom: 50,
          child: RichText(
            text: TextSpan(
              text: 'Call Us: ',
              style: ThemeConstant.textTheme.bodyText1!
                  .copyWith(fontWeight: FontWeight.w400, color: Colors.white),
              children: <TextSpan>[
                TextSpan(
                  text: '017 238 008',
                  style: ThemeConstant.textTheme.bodyText1!.copyWith(
                      fontWeight: FontWeight.w600, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
        Positioned(
            bottom: 5,
            right: 5,
            child: Image.network(
              "https://i.dlpng.com/static/png/6996417_preview.png",
              width: 120,
              height: 120,
              color: Colors.white.withOpacity(0.3),
            ))
      ],
    );
  }
}
