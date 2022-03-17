import 'package:flutter/material.dart';
import '../constant/theme_constant.dart';

class BlackButton extends StatelessWidget {
  final String title;
  final Color? backgroundColor;
  final Function() onPressed;
  final double? width;
  final double? height;
  const BlackButton(
      {Key? key,
      required this.title,
      this.backgroundColor = Colors.black,
      required this.onPressed,
      this.width,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          backgroundColor,
        ),
        textStyle: MaterialStateProperty.all(
          ThemeConstant.textTheme.headline6,
        ),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width ?? 10, vertical: height ?? 15),
        child: Text(
          title.toString(),
        ),
      ),
    );
  }
}
