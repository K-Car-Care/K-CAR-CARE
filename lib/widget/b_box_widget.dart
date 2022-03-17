// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations
import 'package:flutter/material.dart';

class BBoxWidget extends StatelessWidget {
  const BBoxWidget({
    Key? key,
    this.name,
    this.image, this.tag,
  }) : super(key: key);
  final String? name;
  final String? image;
  final String? tag;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 12,
      height: MediaQuery.of(context).size.height / 3.5,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color(0xffECECEC),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(2, 4),
            blurRadius: 4,
            color: const Color(0xff000000).withOpacity(.1),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 2 - 2,
            height: 3,
            color: const Color(0xff0F3EB6),
          ),
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "$image",
                ),
              ),
            ),
          ),
          Hero(
            tag: tag.toString(),
            child: Text(
              "${name ?? "Error Service"}",
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Vollkorn',
                fontWeight: FontWeight.w500,
                color: Color(0xff0F3EB6),
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