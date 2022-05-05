// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations
import 'package:flutter/material.dart';
import 'package:k_car_care_project/core/constant/theme_constant.dart';

class BBoxWidget extends StatelessWidget {
  const BBoxWidget({
    Key? key,
    this.name,
    this.image, 
    this.tag,
    this.color,
    this.index,
  }) : super(key: key);
  
  final String? name;
  final String? image;
  final String? tag;
  final Color? color;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.15,
      height: 150,
      margin: EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 0.5,
          color: Colors.grey.withOpacity(0.3),
          //index == 0 || index == 1 || index == 3 ? defaultColor : Colors.grey.withOpacity(0.3)
        ),
        borderRadius:BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: defaultColor.withOpacity(0.1),
              shape: BoxShape.circle,
              // image: DecorationImage(
              //   image: AssetImage(
              //     "$image",
              //   ),
              // ),
            ),
            child: FittedBox(
              child: Image.asset("$image",width: 20, height: 20,color:defaultColor)
            ),
          ),
          SizedBox(height: 10),
          Hero(
            tag: tag.toString(),
            child: Text(
              "${name ?? "Error Service"}",
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16,
                // fontFamily: 'Vollkorn',
                fontWeight: FontWeight.w500,
                color:Colors.black87.withOpacity(0.8),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}