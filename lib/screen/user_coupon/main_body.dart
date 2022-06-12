import 'package:flutter/material.dart';

import '../../core/constant/theme_constant.dart';
import '../../core/data/promotion_api.dart';
import '../../core/model/user_coupon.dart';
import '../../core/shared/typography.dart';
import 'detail_coupon.dart';

class UserCouponList extends StatefulWidget {
  const UserCouponList({ Key? key }) : super(key: key);

  @override
  _UserCouponListState createState() => _UserCouponListState();
}

class _UserCouponListState extends State<UserCouponList> {

  UserCouponModel? readUserCoupon;
  List<DataUserCoupon>? listUserCoupons;
  PromotionServiceApi promotionServiceApi = PromotionServiceApi();

  @override
  void initState() {
    super.initState();
    initList();
  }

  void initList() async{
    readUserCoupon = await promotionServiceApi.readUserCoupons();
    listUserCoupons = readUserCoupon?.payload;
    setState(() {
    });
  }


  @override
  Widget build(BuildContext context) {
    if(listUserCoupons == null){
      return Container(
        color: Colors.white,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
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
        title: const  Text('Your Coupons',style:TextStyle(color:black,fontWeight: FontWeight.bold)),
        centerTitle:false,
      ),
      body: Center(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: listUserCoupons!.length,
          itemBuilder: (BuildContext context, int index){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius:const BorderRadius.only(
                            topRight: Radius.circular(8.0),
                            topLeft: Radius.circular(8.0),
                          ),
                          color: defaultColor.withOpacity(0.2),
                           image: DecorationImage(
                            // colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
                            fit: BoxFit.cover,
                            image: NetworkImage(listUserCoupons![index].couponId!.img ?? ''),
                          )
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        left: 5,
                        child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: black.withOpacity(0.1),
                                  blurRadius: 20,
                                  offset: const Offset(5, 10),
                                ),
                              ],
                              color: const Color(0xFFe0ebeb),
                              borderRadius:  BorderRadius.circular(8)
                            ),
                            child:  Padding(
                              padding:const  EdgeInsets.symmetric(vertical: 5,horizontal: 15),
                              child: Text(listUserCoupons![index].couponId!.location ?? '', style: TextStyle(color: Colors.black87 , fontSize: 13,fontWeight: FontWeight.w500)),
                            ),
                          ),
                        ),
                    ],
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(8.0),
                        bottomLeft: Radius.circular(8.0),
                      ),
                      color:white
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('10/05/2022 - 15/05/2022',style: bodyTextStyleBlack.copyWith(fontWeight: FontWeight.w600,color: grey)),
                              GestureDetector(
                              onTap: () async{
                                Navigator.push(
                                  context, MaterialPageRoute(builder: (_) =>  DetailCoupon(
                                    img: listUserCoupons![index].couponId!.img ?? '',
                                    title:listUserCoupons![index].couponId!.title ?? '',
                                    desc: listUserCoupons![index].couponId!.description ?? '', 
                                    address: listUserCoupons![index].couponId!.location ?? '',
                                  ))
                                );
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                    color: defaultColor,
                                    borderRadius:  BorderRadius.circular(8)
                                  ),
                                  child: const Padding(
                                    padding:  EdgeInsets.symmetric(vertical: 5,horizontal: 15),
                                    child: Text("Check Details" , style: TextStyle(color: Colors.black87 , fontSize: 13,fontWeight: FontWeight.w600)),
                                  ),
                                ),
                            ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ); 
          }
        ),
      ),
    );
  }
}