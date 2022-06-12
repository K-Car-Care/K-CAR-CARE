
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:k_car_care_project/core/constant/theme_constant.dart';
import 'package:k_car_care_project/core/shared/typography.dart';
import 'package:k_car_care_project/screen/promotion/main_body.dart';

import '../../../core/constant/app_images.dart';
import '../../../core/data/promotion_api.dart';
import '../../../core/model/coupon_model.dart';
import '../../../core/model/promotion.dart';
import '../../../core/model/promotion_category_model.dart';
import '../../../core/model/user_coupon.dart';
import '../../detail_announcement/main_body.dart';
import 'list_category.dart';
import 'list_coupon.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  PromotionServiceApi promotionServiceApi = PromotionServiceApi();
  PromotionCategoryModel? readPromotionsCategory;
  List<DataPromotionCategory>? listPromotionCategory;

  PromotionModel? readPromotions;
  List<DataPromotion>? listPromotion;

  CouponModel? readCoupon;
  List<DataCoupon>? listCoupons;

  UserCouponModel? readUserCoupon;
  List<DataUserCoupon>? listUserCoupons;

  @override
  void initState() {
    super.initState();
    initList();
  }

  void initList() async{
    //garageByService  = (await _serviceApi.readGarageBYServiceApi()) as List<GarageByService>?;
    readPromotionsCategory = await promotionServiceApi.readPromotionsCategory();
    listPromotionCategory = readPromotionsCategory?.payload;

    readPromotions = await promotionServiceApi.readPromotions();
    listPromotion = readPromotions?.payload;

    readCoupon = await promotionServiceApi.readPromotionCoupon();
    listCoupons = readCoupon?.payload;

    readUserCoupon = await promotionServiceApi.readUserCoupons();
    listUserCoupons = readUserCoupon?.payload;
    setState(() {
    });
  }


  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final height  = MediaQuery.of(context).size.height * 1 ;
    // ignore: unused_local_variable
    final width  = MediaQuery.of(context).size.width * 1 ;

    if(listPromotionCategory == null || listPromotion == null){
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
          // leading: IconButton(
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          //   icon: const Icon(
          //     Icons.arrow_back,
          //     color: Colors.black,
          //   ),
          // ),
        title: const  Text('Promotions',style:TextStyle(color:black)),
        centerTitle:false,
        actions: const[
          Icon(Icons.shopping_bag_outlined,color:black),
          SizedBox(width: 10,)
        ],
        bottom: PreferredSize(
          preferredSize:const Size.fromHeight(40),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15 , vertical: 10),
            child: Row(
              children:  [
                Expanded(
                  child: CupertinoTextField(
                  padding: const EdgeInsets.symmetric(vertical: 12 , horizontal: 10),
                  placeholder: "Seach for shop & restaurants",
                  prefix: const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Icon(Icons.search , color: Color(0xff7b7b7b) ,),
                  ),
                  decoration: BoxDecoration(
                      color: const Color(0xfff7f7f7),
                      borderRadius : BorderRadius.circular(50)
                  ),
                  style: const TextStyle(color: Color(0xff707070) , fontSize: 12) ,
                )),
              ],
            ),
          ),
        ),
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15 ,vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             ClipRRect(
               borderRadius: BorderRadius.circular(10),
               child: InkWell(
                 onTap: (){
                   //Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                 },
                 child: Container(
                   height: MediaQuery.of(context).size.height * .18,
                   width: double.infinity,
                   decoration: BoxDecoration(
                     color: defaultColor,
                     borderRadius: BorderRadius.circular(10)
                   ),
                   child: const CustomSliderWidget(
                      items: [
                        "https://lyhourleasing.com/wp-content/uploads/2021/08/New-Promotion-webside-03.png",
                        "https://lyhourleasing.com/wp-content/uploads/2021/08/New-Promotion-webside-01.png",
                        "http://www.mybestcardealer.com/wp-content/uploads/2016/11/Toyota-Discount-November-Promotion-2016.jpg"
                      ],
                    ),
                 ),
               ),
             ),
             Padding(
               padding: const EdgeInsets.symmetric(vertical: 10),
               child: Row(
                 children: [
                   Expanded(
                     flex: 1,
                     child: Container(
                       height: MediaQuery.of(context).size.height * .25,
                       decoration: BoxDecoration(
                           color: white,
                           borderRadius: BorderRadius.circular(10),
                           image: const DecorationImage(
                               fit: BoxFit.cover,
                                 image: NetworkImage('https://img.freepik.com/free-vector/car-promotion-social-media-post-banner-template-vector_434448-179.jpg')
                             )
                       ),
                       child: Padding(
                         padding: const EdgeInsets.all(10.0),
                         child: Stack(
                           alignment: Alignment.center,
                           children: const [
                            //  Positioned(
                            //      bottom: 0,
                            //      left: 0,
                            //      child: Text('pandamart' , style: TextStyle(color: black , fontSize: 18 ),)),
                            //  Positioned(
                            //      bottom: 0,
                            //      left: 0,
                            //      child: Text('panda20 for 20% off' , style: TextStyle(color: black , fontWeight: FontWeight.w500 ,height:1 , fontSize: 14  ))),

                           ],
                         ),
                       ),
                     ),
                   ),
                   const SizedBox(width: 8,),
                   Expanded(
                     flex: 1,
                     child: Column(
                       children: [
                         Container(
                           height: MediaQuery.of(context).size.height * .15,
                           width: double.infinity,
                           decoration: BoxDecoration(
                               color: const Color(0xffef9fc4),
                               borderRadius: BorderRadius.circular(10),
                             image: const DecorationImage(
                               fit: BoxFit.cover,
                                 image: NetworkImage('https://kh.totalenergies.com/km/system/files/atoms/image/car-care-promotion-edito.jpg')

                             )
                           ),
                           child: Padding(
                             padding: const EdgeInsets.all(10.0),
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.end,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: const [
                                //Text('Pick-Uo' , style: TextStyle(color: black , fontSize: 18 ),),
                                 //ext('Upto 50% off' , style: TextStyle(color: black , fontWeight: FontWeight.w500 ,height:1 , fontSize: 14  )),
                               ],
                             ),
                           ),
                         ),
                         const SizedBox(height: 14),
                         Container(
                           height: MediaQuery.of(context).size.height * .1,
                           width: double.infinity,
                           decoration: BoxDecoration(
                               color: const Color(0xff85bfff),
                               borderRadius: BorderRadius.circular(10),
                               image: const DecorationImage(
                               fit: BoxFit.cover,
                                 image: NetworkImage('https://www.mistercarz.com.my/images/headers/facebook/honda-city.jpg')
                                )
                           ),
                           child: Padding(
                             padding: const EdgeInsets.all(10.0),
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.end,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: const  [
                                 //Text('Shops' , style: TextStyle(color: black , fontSize: 18 ),),
                                 //Text('Everyday assentials' , style: TextStyle(color: black , fontWeight: FontWeight.w500 ,height:1 , fontSize: 14  )),

                               ],
                             ),
                           ),

                         )
                       ],
                     ),
                   ),
                 ],
               ),
             ),
             const SizedBox(height:14),
             Row(
               children: [
                 Image.network('https://cdn-icons-png.flaticon.com/512/6782/6782256.png',width: 20,height:20),
                 const SizedBox(width: 7),
                 const Text('Category' , style: TextStyle(color: Color(0xff323232) , fontSize: 17,fontWeight:FontWeight.w600 )),
                 const Spacer(),
                 GestureDetector(
                   onTap:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const CategoryDetail()));
                   },
                   child: Row(
                     children: const [
                        Text('View all',style: TextStyle(color: Colors.grey)),
                        Icon(Icons.arrow_forward_ios_rounded,color: grey,size: 15),
                     ],
                    ),
                  )
               ],
             ),
             const SizedBox(height:14),
             Container(
                width:MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(5)
                  ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Container(
                    decoration: const BoxDecoration(color: white),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 15,
                        bottom: 15,
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          margin: const EdgeInsets.only(left: 15),
                          child: Row( children: List.generate(listPromotionCategory!.length, (index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 40),
                              child: Column(
                                children: [
                                  Image.network(
                                    categories[index]['img'],
                                    width: 40,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    listPromotionCategory![index].name ?? '',
                                    style:  subTitleTextStyleBlack.copyWith(fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            );
                          })),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
             const SizedBox(height:14),
             Row(
               children: [
                 Image.network('https://cdn-icons-png.flaticon.com/512/3199/3199306.png',width: 20,height:20),
                 const SizedBox(width: 7),
                 const Text('Hot promotions' , style: TextStyle(color: Color(0xff323232) , fontSize: 17,fontWeight:FontWeight.w600 )),
                 const Spacer(),
                 GestureDetector(
                   onTap:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Promotion(title:'Hot Productions')));
                   },
                   child: Row(
                     children: const [
                        Text('View all',style: TextStyle(color: Colors.grey)),
                        Icon(Icons.arrow_forward_ios_rounded,color: grey,size: 15),
                     ],
                    ),
                  )
               ],
             ),
             const SizedBox(height:14),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .278,
                child: ListView.builder(
                    itemCount: listPromotion!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index){
                      // PandaPickItemModel model = PandaPickHelper.getStatusItem(index);
                      return RestuarentScreen(
                        name: listPromotion![index].title ?? '',
                        image: listPromotion![index].img ?? '' ,
                        remainingTime:listPromotion![index].nameOwner ?? '' ,
                        totalRating: '5.0',
                        subTitle: 'subtitle',
                        rating: '',
                        deliveryTime:'deliverytime', 
                        deliveryPrice: 'deliveryPrice',
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_) =>  DetailAnnocement(assetImage:  AppImages.sliderImg1)));
                        },
                      );
                    }),
              ),
            ),
            const SizedBox(height:14),
            Row(
              children: [
               Image.network('https://cdn-icons-png.flaticon.com/512/3728/3728890.png',width: 20,height:20),
               const SizedBox(width: 7),
               const Text('Free Coupons' , style: TextStyle(color: Color(0xff323232) , fontSize: 17,fontWeight:FontWeight.w600 )),
               const Spacer(),
               GestureDetector(
                 onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ListCoupons()));
                 },
                 child: Row(
                     children: const [
                        Text('View all',style: TextStyle(color: Colors.grey)),
                        Icon(Icons.arrow_forward_ios_rounded,color: grey,size: 15),
                     ],
                    ),
                )
             ],
            ),
             const SizedBox(height:12),
             SizedBox(
              height: 120,
              child: ListView.builder(
                  itemCount: listCoupons!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){
                    // ignore: unused_local_variable
                    PandaPickItemModel model = PandaPickHelper.getStatusItem(index);
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        decoration:BoxDecoration(
                          borderRadius:BorderRadius.circular(8),
                          color:defaultColor,
                           image: DecorationImage(
                            fit: BoxFit.cover,
                              image: NetworkImage(listCoupons![index].img ?? ''),
                          )
                        ),
                        width: 220,
                      ),
                    );
                  }),
            ),
            const SizedBox(height:14),
            Row(
              children: [
                Image.network('https://cdn-icons-png.flaticon.com/512/3500/3500954.png',width: 20,height:20),
                const SizedBox(width: 7),
                const Text('Recommended Promotion' , style: TextStyle(color: Color(0xff323232) , fontSize: 17,fontWeight:FontWeight.w600 )),
                const Spacer(),
                GestureDetector(
                  onTap:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Promotion(title:'Recommended Promotion')));
                  },
                  child: Row(
                     children: const [
                        Text('View all',style: TextStyle(color: Colors.grey)),
                        Icon(Icons.arrow_forward_ios_rounded,color: grey,size: 15),
                     ],
                    ),
                )
              ],
            ),
            const SizedBox(height:8),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .278,
                child: ListView.builder(
                    itemCount: listPromotion!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index){
                      // PandaPickItemModel model = PandaPickHelper.getStatusItem(index);
                      return RestuarentScreen(
                        name: listPromotion![index].title ?? '',
                        image: listPromotion![index].img ?? '' ,
                        remainingTime:listPromotion![index].nameOwner ?? '' ,
                        totalRating: '5.0',
                        subTitle: 'subtitle',
                        rating: '',
                        deliveryTime:'deliverytime', 
                        deliveryPrice: 'deliveryPrice',
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_) => DetailAnnocement(assetImage:AppImages.sliderImg1)));
                        },
                      );
                    }
                  ),
              ),
            ),
           ],
          ),
        ),
      ),
    );
  }
}



class ReuseListCardCategory extends StatelessWidget {
  final Color getRandomColor;
  final VoidCallback onTap;
  final String image;
  final String title;

  const ReuseListCardCategory({
    Key? key,
    required this.getRandomColor,
    required this.onTap,
    required this.title,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        margin:const EdgeInsets.all(2),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(
              width: 0.5,
              color: grey.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(5),
          color: white
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.withOpacity(0.2),
                // image: DecorationImage(
                //   image: NetworkImage(image),
                //   fit: BoxFit.contain,
                // ),
              ),
              child: Center(
                child:  Image.network(
                    image,
                    width: 30,
                    height: 30,
                    // color:Colors.white,
                  )
                ),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(title,
                maxLines: 2,
                textAlign: TextAlign.center,
                softWrap: true,
                overflow: TextOverflow.fade,
                style: subTitleTextStyleBlack.copyWith(fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}


class ActiveDot extends StatelessWidget {
  const ActiveDot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        width: 8,
        height: 8,
        decoration: BoxDecoration(
          color: defaultColor,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}

class InactiveDot extends StatelessWidget {
  const InactiveDot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        width: 8,
        height: 8,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}

/*
 * for slider home page
 */
class CustomSliderWidget extends StatefulWidget {
  // final List<String> items;
  final List? items;

  const CustomSliderWidget({Key? key, this.items}) : super(key: key);

  @override
  _CustomSliderWidgetState createState() => _CustomSliderWidgetState();
}

class _CustomSliderWidgetState extends State<CustomSliderWidget> {
  int activeIndex = 0;
  setActiveDot(index) {
    setState(() {
      activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none, children: <Widget>[
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: CarouselSlider(
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                setActiveDot(index);
              },
              enableInfiniteScroll: false,
              autoPlayCurve: Curves.fastLinearToSlowEaseIn,
              autoPlayAnimationDuration: const Duration(seconds: 2),
              // autoPlay: true,
              viewportFraction: 1.0,
            ),
            items: widget.items!.map((item) {
              return Builder(
                builder: (BuildContext context) {
                  return Stack(
                    children: <Widget>[
                      SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Image(
                            image: NetworkImage(item),
                            fit: BoxFit.cover,
                          )),
                    ],
                  );
                },
              );
            }).toList(),
          ),
        ),
        Positioned(
          left: 20,
          right: 0,
          bottom: 15,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.items!.length, (idx) {
                return activeIndex == idx ? const ActiveDot() : const InactiveDot();
              })),
        )
      ],
    );
  }
}


const List categories = [
  {"img": "https://cdn-icons-png.flaticon.com/512/7178/7178787.png", "name": "Pickup"},
  {"img": "https://cdn-icons-png.flaticon.com/128/7178/7178738.png", "name": "Grocery"},
  {"img": "https://cdn-icons-png.flaticon.com/128/7178/7178747.png", "name": "Essentials"},
  {"img": "https://cdn-icons-png.flaticon.com/128/7178/7178719.png", "name": "Fruit"},
  {"img": "https://cdn-icons-png.flaticon.com/512/7178/7178674.png", "name": "Alcohol"},
  {"img": "https://cdn-icons-png.flaticon.com/512/7178/7178729.png", "name": "Deals"},
  {"img": "https://cdn-icons-png.flaticon.com/512/7178/7178653.png", "name": "Discount"},
  {"img": "https://cdn-icons-png.flaticon.com/512/7178/7178787.png", "name": "Pickup"},
  {"img": "https://cdn-icons-png.flaticon.com/128/7178/7178738.png", "name": "Grocery"},
  {"img": "https://cdn-icons-png.flaticon.com/128/7178/7178747.png", "name": "Essentials"},
  {"img": "https://cdn-icons-png.flaticon.com/128/7178/7178719.png", "name": "Fruit"},
  {"img": "https://cdn-icons-png.flaticon.com/512/7178/7178674.png", "name": "Alcohol"},
  {"img": "https://cdn-icons-png.flaticon.com/512/7178/7178729.png", "name": "Deals"},
  {"img": "https://cdn-icons-png.flaticon.com/512/7178/7178653.png", "name": "Discount"},
];