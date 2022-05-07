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
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 0.5,
          color:Colors.grey.withOpacity(0.3)
          ),
      ),
      height: 100,
      margin: const EdgeInsets.all(5.0),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            // Container(
            // width: 50,
            // height: 50,
            // padding: const EdgeInsets.all(3.0),
            // decoration: BoxDecoration(
            //     color: color,
            //     border: Border.all(width: 0.5, color: Colors.grey.withOpacity(0.5)),
            //     // borderRadius: BorderRadius.circular(8),
            //     shape: BoxShape.circle,
            //     image: DecorationImage(
            //       image: NetworkImage(icon),
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            //   alignment: Alignment.center,
            // ),
            Expanded(
              // flex: 7,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      // title ,
                      title,
                      style: subTitleTextStyleBlack.copyWith(fontWeight: FontWeight.w600)
                    ),
                    Text(
                      // title ,
                      'Phnom Penh, Terk Tlar',
                      style: bodyTextStyleBlack.copyWith(color:Colors.grey,fontSize: 12),
                    ),
                    // const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('20\$',style: titleTextStyleBlack.copyWith(color:Colors.amber[700],fontWeight: FontWeight.w600)),
                        GestureDetector(
                          onTap: () async{
                            final url = 'tel:$phoneNumber';
                            if (await canLaunch(url)) {
                              await launch(url);
                            }
                          },
                          child: AnimatedContainer(
                          margin: const EdgeInsets.all(2.5),
                          // height: 30,
                          // width: 30,
                          curve: Curves.fastLinearToSlowEaseIn,
                          duration: const Duration(milliseconds: 300),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 20,
                                offset: const Offset(2, 5),
                              ),
                            ],
                            color: defaultColor.withOpacity(0.9),
                            // shape: BoxShape.circle,
                          ),
                          child:  Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              children: [
                                // Icon(
                                //   Icons.request,
                                //   color:Colors.grey.withOpacity(0.7),
                                //   size: 20,
                                // ),
                                Text('Request',style:bodyTextStyleWhite.copyWith(fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ),
                        )
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        
        // ListTile(
        //   contentPadding: const EdgeInsets.all(0),
          // leading: Container(
          //   width: 40,
          //   height: 40,
          //   decoration: BoxDecoration(
          //     color: color,
          //     // border: Border.all(width: 0.5, color: Colors.grey.withOpacity(0.5)),
          //     // shape: BoxShape.circle,
          //     shape: BoxShape.rectangle,
          //      image: DecorationImage(
          //       image: NetworkImage(icon),
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          //   alignment: Alignment.center,
          //   // child: FittedBox(
          //   //   child: Image.network(
          //   //     icon,
          //   //     fit: BoxFit.fill,
          //   //     color: Colors.white,
          //   //   ),
          //   // ),
          // ),
        //   subtitle: Padding(
        //     padding: const EdgeInsets.symmetric(vertical: 3),
        //     child: Column(
        //       children: [
        //         // Text(
        //         //   // desc,
        //         //   '#248, Preah Monivong Blvd. (Street 93), Sangkat Boeung Raing, Khan Daun.',
        //         //   maxLines: 2,
        //         //   overflow: TextOverflow.ellipsis,
        //         //   style: ThemeConstant.textTheme.bodyText2!.copyWith(color: Colors.grey)
        //         // ),
        //         const SizedBox(height: 10),
        //         Row(
        //           children: [
        //             Text('20\$',style: subTitleTextStyleWhite.copyWith(fontWeight: FontWeight.w600,color:const Color(0xFFff0066))),
        //             const Spacer(),
                    // GestureDetector(
                    //   onTap: () async{
                    //     final url = 'tel:$phoneNumber';
                    //     if (await canLaunch(url)) {
                    //       await launch(url);
                    //     }
                    //   },
                    //   child: Container(
                    //     height: 30,
                    //     width:100,
                    //     decoration: BoxDecoration(
                    //       // shape: BoxShape.circle,
                    //       color: defaultColor,
                    //       borderRadius: BorderRadius.circular(5),
                    //     ),
                    //     child:FittedBox(
                    //       child: Row(
                    //         children: [
                    //           IconButton(
                    //             padding: const EdgeInsets.all(5.0),
                    //             icon: const Icon(Icons.call_rounded,color:Colors.white, size: 30,),
                    //             onPressed: ()async{
      
                    //             },
                    //           ),
                    //           Text('ជ្រើសរើស',style: titleTextStyleWhite.copyWith(fontSize: 20,fontWeight: FontWeight.w600))
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    
        //             // Container(
        //             //   height: 30,
        //             //   width:30,
        //             //   decoration: const BoxDecoration(
        //             //     shape: BoxShape.circle,
        //             //     color: defaultColor,
        //             //   ),
        //             //   child:FittedBox(
        //             //     child: IconButton(
        //             //       padding: const EdgeInsets.all(5.0),
        //             //       icon: const Icon(Icons.call_rounded,color:Colors.white, size: 30,),
        //             //       onPressed: ()async{
        //             //         final url = 'tel:$phoneNumber';
        //             //         if (await canLaunch(url)) {
        //             //           await launch(url);
        //             //         }
        //             //       },
        //             //     ),
        //             //   ),
        //             // ),
        //           ],
        //         ),    
        //       ],
        //     ),
        //   ),
        //   title: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
              // Text(
              //   // title,
              //   'TOP AUTO Repair',
              //   style: ThemeConstant.textTheme.bodyText1!.copyWith(
              //     color: Colors.black,
              //     fontWeight: FontWeight.w500,
              //   ),
              // ),
              
        //       // InkWell(
        //       //   onTap: () async {
        //           // final url = 'tel:$phoneNumber';
        //           // if (await canLaunch(url)) {
        //           //   await launch(url);
        //           // }
        //       //   },
        //       //   child: Text(
        //       //     phoneNumber,
        //       //     style: ThemeConstant.textTheme.bodyText2!.copyWith(
        //       //       color: color,
        //       //     ),
        //       //   ),
        //       // ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
