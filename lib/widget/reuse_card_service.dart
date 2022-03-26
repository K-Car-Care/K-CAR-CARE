import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:k_car_care_project/core/constant/app_images.dart';
import 'package:k_car_care_project/core/constant/theme_constant.dart';
import 'package:k_car_care_project/core/shared/typography.dart';
import 'package:url_launcher/url_launcher.dart';

class CardService extends StatelessWidget {
  final Color color;
  final String icon;
  final String title;
  final String phoneNumber;
  final String desc;
  const CardService({
    Key? key,
    required this.color,
    required this.icon,
    required this.title,
    required this.phoneNumber,
    required this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListTile(
          contentPadding: const EdgeInsets.all(3),
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color,
              // border: Border.all(width: 0.5, color: Colors.grey.withOpacity(0.5)),
              // shape: BoxShape.circle,
              shape:BoxShape.circle,
              //  image: new DecorationImage(
              //   image: new AssetImage(AppImages.carServiceImg),
              //   fit: BoxFit.cover,
              // ),
            ),
            alignment: Alignment.center,
            child: FittedBox(
              child: Image.asset(
                AppImages.carServiceImg,
                fit: BoxFit.fill,
                color: Colors.white,
              ),
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: Column(
              children: [
                Text(
                  // desc,
                  '#248, Preah Monivong Blvd. (Street 93), Sangkat Boeung Raing, Khan Daun.',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: ThemeConstant.textTheme.bodyText2!.copyWith(color: Colors.grey)
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text('20\$',style: subTitleTextStyleWhite.copyWith(fontWeight: FontWeight.w600,color:const Color(0xFFff0066))),
                    const Spacer(),
                    GestureDetector(
                      onTap: () async{
                        final url = 'tel:$phoneNumber';
                        if (await canLaunch(url)) {
                          await launch(url);
                        }
                      },
                      child: Container(
                        height: 30,
                        width:100,
                        decoration: BoxDecoration(
                          // shape: BoxShape.circle,
                          color: defaultColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child:FittedBox(
                          child: Row(
                            children: [
                              IconButton(
                                padding: const EdgeInsets.all(5.0),
                                icon: const Icon(Icons.assistant_direction_rounded,color:Colors.white, size: 30,),
                                onPressed: ()async{
      
                                },
                              ),
                              Text('ជ្រើសរើស',style: titleTextStyleWhite.copyWith(fontSize: 20,fontWeight: FontWeight.w600))
                            ],
                          ),
                        ),
                      ),
                    ),
                    
                    // Container(
                    //   height: 30,
                    //   width:30,
                    //   decoration: const BoxDecoration(
                    //     shape: BoxShape.circle,
                    //     color: defaultColor,
                    //   ),
                    //   child:FittedBox(
                    //     child: IconButton(
                    //       padding: const EdgeInsets.all(5.0),
                    //       icon: const Icon(Icons.call_rounded,color:Colors.white, size: 30,),
                    //       onPressed: ()async{
                    //         final url = 'tel:$phoneNumber';
                    //         if (await canLaunch(url)) {
                    //           await launch(url);
                    //         }
                    //       },
                    //     ),
                    //   ),
                    // ),
                  ],
                ),    
              ],
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                // title,
                'TOP AUTO Repair',
                style: ThemeConstant.textTheme.bodyText1!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              
              // InkWell(
              //   onTap: () async {
                  // final url = 'tel:$phoneNumber';
                  // if (await canLaunch(url)) {
                  //   await launch(url);
                  // }
              //   },
              //   child: Text(
              //     phoneNumber,
              //     style: ThemeConstant.textTheme.bodyText2!.copyWith(
              //       color: color,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
