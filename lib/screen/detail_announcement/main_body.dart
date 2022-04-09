import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:k_car_care_project/core/constant/app_images.dart';
import 'package:k_car_care_project/core/shared/typography.dart';

class DetailAnnocement extends StatefulWidget {
  final String assetImage;
  const DetailAnnocement({ Key? key,required this.assetImage }) : super(key: key);

  @override
  State<DetailAnnocement> createState() => _DetailAnnocementState();
}

class _DetailAnnocementState extends State<DetailAnnocement> {
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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // backgroundColor: defaultColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        centerTitle: false,
        title: Text('Annocement Detail',
            style: subTitleTextStyleBlack.copyWith(fontWeight: FontWeight.w600)
        ),
        
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              Container(
                height: 170,
                width:double.maxFinite,
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    image: AssetImage(widget.assetImage), /// change this to your  image directory
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const  SizedBox(height: 7,),
              Text(
                'Up to US \$20 off shipping',
                textAlign:  TextAlign.justify,
                style: titleTextStyleBlack.copyWith(fontWeight: FontWeight.w600, fontSize: 25)
              ),
              const  SizedBox(height: 7,),
              Text(
                'March is going to pass to and April is comming that mean it Su,,er already! The Cooktail Store offered upyo 80%  for this summer season.Don;t miss this spacial offer! Go to checkthe menu at the Colltail Store now to get your drinl with the discount.',
                textAlign:  TextAlign.justify,
                style: subTitleTextStyleBlack,
              )
            ],
          ),
        ),
      ),
      // bottomSheet: SizedBox(
      //   height:70,
      //   width:double.maxFinite,
      //   child: CarouselWidget(
      //         onPageChanged: (val, carouselPageChangedReason) {
      //           // setState(() {
      //           //   dotPosition = val;
      //           // });
      //         },
      //         items: carouselImage.map((i) {
      //           return Builder(
      //             builder: (BuildContext context) {
      //               return GestureDetector(
      //                 onTap:(){
      //                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) =>  DetailAnnocement(assetImage:i)));
      //                 },
      //                 child: Container(
      //                   width: MediaQuery.of(context).size.width,
      //                   margin: const EdgeInsets.symmetric(horizontal: 5.0),
      //                   decoration: BoxDecoration(
      //                     image: DecorationImage(
      //                       fit: BoxFit.fill,
      //                       image: AssetImage(i),
      //                     ),
      //                     color: Colors.blue,
      //                   ),
      //                 ),
      //               );
      //             },
      //           );
      //         }).toList(),
      //       ),
      // ),
    );
  }
}