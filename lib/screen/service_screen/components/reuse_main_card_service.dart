import 'package:flutter/material.dart';

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
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: color, width: 1)),
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
                    child: Image.asset(
                      image,
                      color: color,
                      width: 60,
                      height: 60,
                    ),
                  )),
              ListTile(
                title: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: color),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
