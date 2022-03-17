import 'package:flutter/material.dart';
import 'package:k_car_care_project/constant/theme_constant.dart';

class ContainerRaduis extends StatelessWidget {
  final String assetPath;
  const ContainerRaduis({
    Key? key,
    required this.assetPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: defaultColor.withOpacity(0.1),
      ),
      child: Center(
        child: Image.asset(
          assetPath,
          color: defaultColor,
          width: 40,
          height: 40,
        ),
      ),
    );
  }
}
