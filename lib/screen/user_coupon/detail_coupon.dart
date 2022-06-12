import 'package:flutter/material.dart';
import '../../core/constant/theme_constant.dart';
import '../../core/shared/typography.dart';

class DetailCoupon extends StatefulWidget {
  final String? img;
  final String? title;
  final String? startDate;
  final String? endDate;
  final double? locationX;
  final double? locationY;
  final String? address;
  final String? desc;
  const DetailCoupon({
    Key? key,
    this.img,
    this.title,
    this.startDate,
    this.endDate,
    this.locationX,
    this.locationY,
    this.address,
    this.desc
  }) : super(key: key);

  @override
  _DetailCouponState createState() => _DetailCouponState();
}

class _DetailCouponState extends State<DetailCoupon> {
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
        title: Text('Coupon Detail',
          style: titleTextStyleBlack.copyWith(fontWeight: FontWeight.w700)
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
                    image: NetworkImage(widget.img!), /// change this to your  image directory
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const  SizedBox(height: 14,),
              Text(
                widget.title!,
                textAlign:  TextAlign.start,
                style: titleTextStyleBlack.copyWith(fontWeight: FontWeight.w600, fontSize: 22)
              ),
              const  SizedBox(height: 14,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: grey.withOpacity(0.2),
                      borderRadius:  BorderRadius.circular(8)
                    ),
                    child:  const Padding(
                      padding:  EdgeInsets.symmetric(vertical: 5,horizontal: 15),
                      child: Text('10/05/2022 - 15/05/2022', style: TextStyle(color: Colors.black87 , fontSize: 13,fontWeight: FontWeight.w500)),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: defaultColor.withOpacity(0.7),
                      borderRadius:  BorderRadius.circular(8)
                    ),
                    child:  Padding(
                      padding:  const EdgeInsets.symmetric(vertical: 5,horizontal: 15),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.location_on_outlined,
                          ),
                          Text('Location', style: TextStyle(color: Colors.black87 , fontSize: 13,fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const  SizedBox(height: 14,),
              Text(
                widget.address!,
                textAlign:  TextAlign.justify,
                style: subTitleTextStyleBlack.copyWith(color:grey),
              ),
              const  SizedBox(height: 14,),
              Text(
                widget.desc!,
                textAlign:  TextAlign.justify,
                style: subTitleTextStyleBlack,
              ),
              const  SizedBox(height: 14,),
              Center(
                child: Image.network('https://i.stack.imgur.com/YLy3V.png',width: 200,height: 200)
              ),
              const  SizedBox(height: 14,),
              Center(
                child: Text(
                  'SCAN HERE',
                  textAlign:  TextAlign.justify,
                  style: subTitleTextStyleBlack.copyWith(fontWeight: FontWeight.w600, fontSize: 22)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}