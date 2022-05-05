// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:k_car_care_project/core/constant/app_images.dart';
import 'package:k_car_care_project/core/constant/theme_constant.dart';
import 'package:k_car_care_project/core/shared/typography.dart';
import 'package:k_car_care_project/screen/profile_screen/add_more_info_screen.dart';

import '../widget/carousel_widget.dart';
import '../widget/dot_indicator_widget.dart';
import 'detail_announcement/main_body.dart';

class Episode1 extends StatefulWidget {
  const Episode1({Key? key}) : super(key: key);

  @override
  State<Episode1> createState() => _Episode1State();
}

class _Episode1State extends State<Episode1> {

  var dotPosition = 0;
  List<String> carouselImage = [
    AppImages.sliderImg1,
    AppImages.sliderImg2,
    AppImages.sliderImg3,
    AppImages.sliderImg4,
    AppImages.sliderImg5,
    AppImages.sliderImg6
  ];


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // Lets add some image urls in a list from internet
    final List<String> imageUrls = [
      "https://images.unsplash.com/photo-1589802829985-817e51171b92?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8&w=1000&q=80",
      "https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bW91bnRhaW5zfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80",
      "https://images.unsplash.com/photo-1469212044023-0e55b4b9745a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MTN8fHxlbnwwfHx8fA%3D%3D&w=1000&q=80",
      "https://images-na.ssl-images-amazon.com/images/I/7172GO732JL.jpg",
      "https://images.unsplash.com/photo-1503401639559-b16332601594?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBF4LrgShMe3w2C83nIYK7iixTRP-PMShk-A&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuZa30MBbjHnxeEw2aLBcEf2VTZRMkp8NyUQ&usqp=CAU",
      "https://images.all-free-download.com/images/graphicthumb/the_snow_mountain_which_burns_514266.jpg",
      "https://media.istockphoto.com/photos/todra-gorge-morocco-africa-picture-id474289763?k=6&m=474289763&s=612x612&w=0&h=vIv-5PVtNX-Tevquxr_jakEioiIvEwsaCZtw-KsJZHI=",
    ];
    return Scaffold(
      // backgroundColor: Colors.transparent,
      body: CustomScrollView(
        slivers: [
          // 1) Creating AppBar
          const SliverAppBar(
            backgroundColor: Colors.transparent,
            // pinned: true,
            leading: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            backwardsCompatibility: false,
            // systemOverlayStyle: SystemUiOverlayStyle(
            //   // statusBarColor: Colors.white,
            // ),
          ),

          // 2) Creating profile area
          SliverToBoxAdapter(
            child: SizedBox(
              child: Column(
                children: [
                  // 2.1) Creating profile image
                  Container(
                    height: 120,
                    width: 120,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage("https://miro.medium.com/fit/c/176/176/0*0Fbit-Q_iQF90mh4"),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // 2.2) Creating username
                  const Text(
                    "Von Seyha",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // 2.3) Creating profession area
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "seyhavon22@gmail.com",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                        ),
                      ),
                      const VerticalDivider(
                        thickness: 1,
                        color: Colors.grey,
                        width: 10,
                      ),
                      // const Text(
                      //   "Daily",
                      //   style: TextStyle(
                      //     color: Colors.grey,
                      //     fontSize: 17,
                      //   ),
                      // ),
                      const SizedBox(
                        width: 3,
                      ),
                      // GestureDetector(
                      //   onTap: (){
                      //     // Episode1
                      //     showModalBottomSheet(
                      //       useRootNavigator: true,
                      //       isScrollControlled: true,
                      //       context: context,
                      //       clipBehavior: Clip.antiAlias,
                      //       shape: const RoundedRectangleBorder(
                      //         borderRadius:
                      //             BorderRadius.vertical(
                      //           top: Radius.circular(24),
                      //         ),
                      //       ),
                      //       builder: (context) {
                      //         return StatefulBuilder(builder:
                      //             (context, setModalState) {
                      //           return  SizedBox(
                      //             height: MediaQuery.of(context).size.height -200,
                      //             child: AddMoreInfoScreen()
                      //           );
                      //         });
                      //       }
                      //     );
                      //   },
                      //   child: Container(
                      //     alignment: Alignment.center,
                      //     height: 22,
                      //     width: 22,
                      //     decoration: const BoxDecoration(
                      //       color: defaultColor,
                      //       shape: BoxShape.circle,
                      //     ),
                      //     child:const Icon(
                      //       Icons.mode_edit_rounded,
                      //       size: 17,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                  // const SizedBox(
                  //   height: 20,
                  // ),

                  // 3) Creating social media buttons
                  // Wrap(
                  //   direction: Axis.horizontal,
                  //   spacing: 20.0,
                  //   runSpacing: 10.0,
                  //   children: [
                  //     CustomSocialButton(
                  //       backgroundColor: Colors.pink[50]!,
                  //       imagePath: "https://w7.pngwing.com/pngs/826/884/png-transparent-dribbble-logo-graphic-design-design-web-design-user-interface-design-photography-thumbnail.png",
                  //       onTap: () {},
                  //     ),
                  //     CustomSocialButton(
                  //       backgroundColor: Colors.blue[50]!,
                  //       imagePath: "https://w7.pngwing.com/pngs/826/884/png-transparent-dribbble-logo-graphic-design-design-web-design-user-interface-design-photography-thumbnail.png",
                  //       onTap: () {},
                  //     ),
                  //     CustomSocialButton(
                  //       backgroundColor: Colors.grey[100]!,
                  //       imagePath: "https://w7.pngwing.com/pngs/826/884/png-transparent-dribbble-logo-graphic-design-design-web-design-user-interface-design-photography-thumbnail.png",
                  //       onTap: () {},
                  //     ),
                  //     CustomSocialButton(
                  //       backgroundColor: Colors.blue[50]!,
                  //       imagePath: "https://w7.pngwing.com/pngs/826/884/png-transparent-dribbble-logo-graphic-design-design-web-design-user-interface-design-photography-thumbnail.png",
                  //       onTap: () {},
                  //     ),
                  //   ],
                  // ),
                  // const SizedBox(height: 22),
                  // 4) Creating stats area
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: const [
                  //     StatsItem(
                  //       value: 80,
                  //       label: "Used Service",
                  //     ),
                  //     StatsItem(
                  //       value: 110,
                  //       label: "Saving Point",
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(height: 22),
                  // 5) Creating own custom buttons
                  // ItemProfile(size: size,value: 'seyhavon22@gmail.com',title: 'Email',),
                  ItemProfile(size: size,value: '0969840040',title: 'Phonenumber',),
                  ItemProfile(size: size,value: 'sahak pon rusi, Phnom Penh 271',title: 'Location',),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Your Cars',textAlign: TextAlign.start),
                          GestureDetector(
                        onTap: (){
                          // Episode1
                          showModalBottomSheet(
                            useRootNavigator: true,
                            isScrollControlled: true,
                            context: context,
                            clipBehavior: Clip.antiAlias,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.vertical(
                                top: Radius.circular(24),
                              ),
                            ),
                            builder: (context) {
                              return StatefulBuilder(builder:
                                  (context, setModalState) {
                                return  SizedBox(
                                  height: MediaQuery.of(context).size.height -200,
                                  child: AddMoreInfoScreen()
                                );
                              });
                            }
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 22,
                          width: 22,
                          decoration: const BoxDecoration(
                            color: defaultColor,
                            shape: BoxShape.circle,
                          ),
                          child:const Icon(
                            Icons.add,
                            size: 17,
                          ),
                        ),
                      ),
                        ],
                      ),
                    )
                  ),

                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child:CarouselWidget(
                      height: 220,
                      onPageChanged: (val, carouselPageChangedReason){
                        setState(() {
                          dotPosition = val;
                        });
                      },
                      items: carouselImage.map((i) {
                        return Builder(
                          builder: (BuildContext context){
                            return Container(
                              margin: const EdgeInsets.only(top: 5,left: 5),
                              height: 220,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(255, 255, 255, 1),
                                border: Border.all(
                                  width: 0.5,
                                  color: Colors.grey.withOpacity(0.3),
                                  //index == 0 || index == 1 || index == 3 ? defaultColor : Colors.grey.withOpacity(0.3)
                                ),
                                borderRadius:BorderRadius.circular(8),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 120,
                                    decoration:BoxDecoration(
                                      borderRadius:BorderRadius.circular(8),
                                      color:defaultColor,
                                      image: const DecorationImage(
                                        fit: BoxFit.cover,
                                          image: NetworkImage('https://www.pngall.com/wp-content/uploads/2016/07/Car-High-Quality-PNG.png')
                                      )
                                    ),
                                    // width: 220,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8),
                                    child: Column(
                                      // mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(width: 5,),
                                        Row(
                                          mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Car Title', style: titleTextStyleBlack.copyWith(fontWeight: FontWeight.w600)),
                                            GestureDetector(
                                            onTap: (){
                                              // Episode1
                                              showModalBottomSheet(
                                                useRootNavigator: true,
                                                isScrollControlled: true,
                                                context: context,
                                                clipBehavior: Clip.antiAlias,
                                                shape: const RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.vertical(
                                                    top: Radius.circular(24),
                                                  ),
                                                ),
                                                builder: (context) {
                                                  return StatefulBuilder(builder:
                                                      (context, setModalState) {
                                                    return  SizedBox(
                                                      height: MediaQuery.of(context).size.height -200,
                                                      child: AddMoreInfoScreen()
                                                    );
                                                  });
                                                }
                                              );
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              height: 22,
                                              width: 22,
                                              decoration: const BoxDecoration(
                                                color: defaultColor,
                                                shape: BoxShape.circle,
                                              ),
                                              child:const Icon(
                                                Icons.mode_edit_rounded,
                                                size: 17,
                                              ),
                                            ),
                                          ),
                                          ],
                                        ),
                                        const SizedBox(width: 5,),
                                        Row(
                                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                borderRadius:BorderRadius.circular(5),
                                                color: grey.withOpacity(0.1)
                                              ),
                                              child: Text('Make', style: subTitleTextStyleBlack.copyWith(color: Colors.black54),),
                                            ),
                                            const SizedBox(width: 5,),
                                            Container(
                                              padding: const EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                borderRadius:BorderRadius.circular(5),
                                                color: grey.withOpacity(0.1)
                                              ),
                                              child: Text('Model', style: subTitleTextStyleBlack.copyWith(color: Colors.black54),),
                                            ),
                                            const SizedBox(width: 5,),
                                            Container(
                                              padding: const EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                borderRadius:BorderRadius.circular(5),
                                                color: grey.withOpacity(0.1)
                                              ),
                                              child: Text('Year', style: subTitleTextStyleBlack.copyWith(color: Colors.black54),),
                                            ),
                                            const SizedBox(width: 5,),
                                          ],
                                        ),
                                        
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DotIndicatorWidget(
                    dotsCount: carouselImage.isEmpty ? 3 : carouselImage.length,
                    dotPosition: dotPosition.toDouble(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ItemProfile extends StatelessWidget {
  const ItemProfile({
    Key? key,
    required this.size,
    this.title,
    this.value,
  }) : super(key: key);

  final Size size;
  final String? title;
  final String? value;
  // final 

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 8),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              width: 0.5,
              color: Colors.grey.withOpacity(0.3),
              //index == 0 || index == 1 || index == 3 ? defaultColor : Colors.grey.withOpacity(0.3)
            ),
          ),
        child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: (size.width - 40) * 0.7,
          child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  child: Center(
                    child: Image.asset(
                      AppImages.assetCarExpense,
                      width: 35,
                      height: 35,
                      //  color:,
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                SizedBox(
                  width: (size.width - 90) * 0.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title!,
                        style: TextStyle(fontSize: 12,color: black.withOpacity(0.5),fontWeight: FontWeight.w400),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        value!,
                        style: TextStyle(fontSize: 15,color: black.withOpacity(0.8),fontWeight: FontWeight.w500),
                        // overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            //  width: (size.width - 40) * 0.1,
            child: Icon(Icons.arrow_forward_ios_rounded,color:grey,size: 20)
          )
        ],
          )));
  }
}

class CustomButton extends StatelessWidget {
  final Color borderColor;
  final Color textColor;
  final String text;
  final Color backgroundColor;

  const CustomButton({
    Key? key,
    required this.borderColor,
    required this.textColor,
    required this.text,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(4.0),
      color: backgroundColor,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(4.0),
        child: Container(
          alignment: Alignment.center,
          height: 45,
          width: (MediaQuery.of(context).size.width / 2) - 30,
          decoration: BoxDecoration(
            border: Border.all(
              color: borderColor,
            ),
            borderRadius: BorderRadius.circular(4.0),
            color: Colors.transparent,
          ),
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 17,
            ),
          ),
        ),
      ),
    );
  }
}

class StatsItem extends StatelessWidget {
  final int value;
  final String label;

  const StatsItem({
    Key? key,
    required this.value,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value.toString(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        Text(label),
      ],
    );
  }
}

class CustomSocialButton extends StatelessWidget {
  final Color backgroundColor;
  final String imagePath;
  final GestureTapCallback onTap;

  const CustomSocialButton({
    Key? key,
    required this.backgroundColor,
    required this.imagePath,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(14),
      color: backgroundColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.transparent,
          ),
          child: Image.network(
            imagePath,
            height: 20,
            width: 20,
          ),
        ),
      ),
    );
  } 
}  











class CarCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final String background;
  final bool isOdd;

  CarCard(
      this.title,
      this.subtitle,
      this.image,
      this.background,
      this.isOdd,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 351,
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 5,
            right: !isOdd ? 20 : 0,
            left: !isOdd ? 0 : 20,
            child: new Container(
                width: 351,
                height: 62,
                decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(colors: [
                      Color(0xff3c80f7),
                      Color(0xff1058d1) ],
                        stops: [
                          0,
                          1
                        ]
                    )
                )
            ),
          ),

          isOdd ?
              Positioned(
                left: 60,
                bottom: 20,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Text(title,
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Color(0xffffffff),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          letterSpacing: 0,

                        )
                    ),
                    new Text(subtitle,
                        style: TextStyle(
                          fontFamily: 'AlegreyaSansSC',
                          color: Color(0xffffffff),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          letterSpacing: 0,

                        )
                    )

                  ],
                ),
              )
          :
            Positioned(
              bottom: 20,
              right: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text(title,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Color(0xffffffff),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        letterSpacing: 0,

                      )
                  ),
                  new Text(subtitle,
                      style: TextStyle(
                        fontFamily: 'AlegreyaSansSC',
                        color: Color(0xffffffff),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        letterSpacing: 0,

                      )
                  )

                ],
              ),
            ),

          // Background
          isOdd ?
          Positioned(
            right: 5,
            top: 20,
            child: Container(
              height: 92,
              width: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(background),
                      fit: BoxFit.cover
                  )
              ),
            ),
          )
              :
          Positioned(
            left: 5,
            top: 20,
            child: Container(
              height: 92,
              width: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(background),
                      fit: BoxFit.cover
                  )
              ),
            ),
          ),


          isOdd ?
            Positioned(
            right: 20,
            top: 20,
            child: Container(
              height: 92,
              width: 152,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover
                )
              ),
            ),
          )
            :
            Positioned(
            left: 20,
            top: 20,
            child: Container(
              height: 92,
              width: 152,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover
                  )
              ),
            ),
            )

        ],
      ),

    );
  }
}