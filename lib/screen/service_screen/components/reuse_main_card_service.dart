import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:k_car_care_project/constant/theme_constant.dart';

class MainCardService extends StatelessWidget {
  final String image;
  final String title;
  final Color color;
  const MainCardService({
    Key? key,
    required this.image,
    required this.color,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              // border: Border.all(color: color, width: 1)
              boxShadow:const [ //background color of box
                BoxShadow(
                  color:Color(0xFFf5f5f5),
                  blurRadius: 1.0, // soften the shadow
                  spreadRadius:1.0, //extend the shadow
                  offset: Offset(
                    1.0, // Move to right 10  horizontally
                    1.0, // Move to bottom 10 Vertically
                  ),
                )
              ],
            ),
          // shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  // padding: const EdgeInsets.only(right: 10, top: 15),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.network(
                      image, //color: color,
                      width: 50,
                      height: 50,
                    ),
                  )
                ),
                ListTile(
                  title: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20, color: defaultColor),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
