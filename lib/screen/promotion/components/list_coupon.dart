import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:k_car_care_project/core/shared/typography.dart';
import '../../../core/constant/theme_constant.dart';
import '../../../core/data/promotion_api.dart';
import '../../../core/model/coupon_model.dart';

class ListCoupons extends StatefulWidget {
  const ListCoupons({ Key? key }) : super(key: key);

  @override
  _ListCouponsState createState() => _ListCouponsState();
}

class _ListCouponsState extends State<ListCoupons> {

  PromotionServiceApi promotionServiceApi = PromotionServiceApi();
  CouponModel? readCoupon;
  List<DataCoupon>? listCoupons;

  @override
  void initState() {
    super.initState();
    initList();
  }

  void initList() async{
    readCoupon = await promotionServiceApi.readPromotionCoupon();
    listCoupons = readCoupon?.payload;
    setState(() {
    });
  }


  @override
  Widget build(BuildContext context) {

    if(listCoupons == null){
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
        title: const  Text('All Coupons',style:TextStyle(color:black,fontWeight: FontWeight.bold)),
        centerTitle:false,
      ),
      body: Center(
        child: ListView.builder(
          padding: const EdgeInsets.only(top:3),
          scrollDirection: Axis.vertical,
          itemCount: listCoupons!.length,
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
                            image: NetworkImage(listCoupons![index].img ?? ''),
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
                              child: Text(listCoupons![index].location ?? '', style: TextStyle(color: Colors.black87 , fontSize: 13,fontWeight: FontWeight.w500)),
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
                                EasyLoading.show(
                                  status: 'Loading...',
                                  maskType: EasyLoadingMaskType.black,
                                );
                                await Future.delayed(const Duration(seconds: 2));
                                EasyLoading.dismiss();
                                EasyLoading.showSuccess(
                                  'Add success!',
                                  maskType: EasyLoadingMaskType.black,
                                );
                                listCoupons!.removeAt(index);
                                setState(() {
                                  
                                });
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                    color: defaultColor,
                                    borderRadius:  BorderRadius.circular(8)
                                  ),
                                  child: const Padding(
                                    padding:  EdgeInsets.symmetric(vertical: 5,horizontal: 15),
                                    child: Text("GET" , style: TextStyle(color: Colors.black87 , fontSize: 15,fontWeight: FontWeight.w600)),
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