import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:k_car_care_project/core/constant/app_images.dart';

class MainCardService extends StatelessWidget {
  final String image;
  final String title;
  const MainCardService({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 0.5,
          color:Colors.grey.withOpacity(0.3)),
        borderRadius:BorderRadius.circular(8),
      ),
      // shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Container(
          //   alignment: Alignment.center,
          //   // padding: const EdgeInsets.only(right: 10, top: 15),
          //   child: Padding(
          //     padding: const EdgeInsets.all(0.0),
          //     child: Image.network(
          //       image, //color: color,
          //       width: 80,
          //       height: 80,
          //     ),
          //   )
          // ),
          Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.withOpacity(0.2),
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.fill,
                ),
              ),
              // child: Center(
              //   child:  Image.network(
              //       image,
              //       width: 50,
              //       height: 50,
              //       color:Colors.white,
              //     )
              //   ),
            ),
          ListTile(
            title: Text(
              title.toUpperCase(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                // fontFamily: 'Vollkorn',
                fontWeight: FontWeight.w600,
                color:Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
