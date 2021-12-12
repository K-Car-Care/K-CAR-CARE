import 'package:flutter/material.dart';

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
        color: const Color(0xff0185BE).withOpacity(0.1),
      ),
      child: Center(
        child: Image.asset(
          assetPath,
          color: const Color(0xff2ac3ff),
          width: 40,
          height: 40,
        ),
      ),
    );
  }
}
