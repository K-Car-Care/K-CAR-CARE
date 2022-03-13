// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:k_car_care_project/core/model/info_window_model/infoWindowType.dart';

class CustomWindow extends StatelessWidget {
  const CustomWindow({Key? key, required this.info}) : super(key: key);
  final CarInfoWindow info;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                      color: const Color(0xFF3E3D3D).withOpacity(.4),
                      spreadRadius: 2,
                      blurRadius: 5),
                ],
              ),
              width: double.infinity,
              height: double.infinity,
              child: Row(
                children: [
                  if (info.type == InfoWindowType.position)
                    Container(
                      width: MediaQuery.of(context).size.width * 0.12,
                      color: const Color(0xFF2669A4),
                      height: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('${(info.time!.inMinutes) % 60}',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  ?.copyWith(color: const Color(0xFFFFFFFF))),
                          Text('min',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.copyWith(color: const Color(0xFFFFFFFF))),
                        ],
                      ),
                    ),
                  Expanded(
                      child: Text(
                    '${info.name}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: const Color(0xFF3E3D3D)),
                  )
                      // .paddingAll(8)

                      ),
              
                  Icon(Icons.arrow_forward_ios,
                      size: 16, color: Color(0xFF3E3D3D)),
                  const SizedBox(width: 4),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
