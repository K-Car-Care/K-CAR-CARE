import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:k_car_care_project/core/constant/app_images.dart';
import 'package:k_car_care_project/screen/detail_announcement/main_body.dart';
import 'package:k_car_care_project/screen/drawer_screen/main_drawer.dart';
import 'package:k_car_care_project/screen/google_map_screen/find_garage_map_screen.dart';
import 'package:k_car_care_project/screen/notification_screen/main_notification.dart';
import 'package:k_car_care_project/screen/promotion/main_body.dart';
import 'package:k_car_care_project/screen/redesign_expense_ui/main_body.dart';
import '../../core/constant/theme_constant.dart';
import '../../core/data/main_service_api.dart';
import '../../core/data/promotion_api.dart';
import '../../core/model/coupon_model.dart';
import '../../core/model/main_services_models/main_model.dart';
import '../../core/model/promotion.dart';
import '../../core/model/promotion_category_model.dart';
import '../../core/shared/typography.dart';
import '../../widget/b_box_widget.dart';
import '../../widget/carousel_widget.dart';
import '../../widget/dot_indicator_widget.dart';
import '../car_relevent_new_screen/car_relevent_news_screen.dart';
import '../history_screen.dart/main_history_screen.dart';
import '../promotion/components/list_coupon.dart';
import '../promotion/components/main_promotion.dart';
import '../service_screen/main_servce.dart';
import '../test_profile.dart';
import '../towing_request/main_body.dart';
import 'components/card_towing.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  List<String> carouselImage = [
    AppImages.sliderImg1,
    AppImages.sliderImg2,
    AppImages.sliderImg3,
    AppImages.sliderImg4,
    AppImages.sliderImg5,
    AppImages.sliderImg6
  ];

  // // ignore: prefer_final_fields
  // List<MainModel> _mainBox = [
  //   MainModel(
  //     name: 'View History',
  //     image: AppImages.historyImg,
  //     color: const Color(0xFFff0066)
  //   ),
  //   MainModel(
  //     name: 'Repair Exspense',
  //     image: AppImages.repairCostImg,
  //     color: const Color(0xFFfea832)
  //   ),
  //   MainModel(
  //     name: 'News Letter',
  //     image: AppImages.carReleventNews,
  //     color: const Color.fromARGB(255, 230, 19, 57)
  //   ),
  //   MainModel(
  //     name: 'Account',
  //     image: AppImages.profileImg,
  //     color: const Color(0xFF0F3EB6)
  //   ),
  //   MainModel(
  //     name: 'Car Assistant Service',
  //     image: AppImages.carServiceImg,
  //     color: const  Color.fromARGB(255, 54, 135, 216)
  //   ),
  //   MainModel(
  //     name: 'Find Repair \nGarage',
  //     image: AppImages.repairService,
  //     color: const Color.fromARGB(235, 5, 201, 152)
  //   ),
  // ];

  // navigate(int index) {
  //   if (_mainBox[index].name.toUpperCase() == "CAR ASSISTANT SERVICE".toUpperCase()) {
  //     Navigator.push( context, MaterialPageRoute(builder: (_) => const ServiceScreen()));
  //   } else if (_mainBox[index].name.toUpperCase() == "FIND REPAIR \nGARAGE".toUpperCase()) {
  //     Navigator.push(context, MaterialPageRoute(builder: (_) => const GoogleMapScreen()));
  //   } else if (_mainBox[index].name.toUpperCase() == "REPAIR EXPENSE".toUpperCase()) {
  //     Navigator.push(context, MaterialPageRoute( builder: (_) => const NewUIDesign(),));
  //   } else if (_mainBox[index].name.toUpperCase() == "NEWS LETTER".toUpperCase()) {
  //     Navigator.push(context,MaterialPageRoute(builder: (_) => const CarReleventNewsScreen()));
  //   } else if (_mainBox[index].name.toUpperCase() == "VIEW HISTORY".toUpperCase()) {
  //     Navigator.push(context, MaterialPageRoute(builder: (_) => const HisstoryScreen()));
  //   } else if (_mainBox[index].name.toUpperCase() == "account".toUpperCase()) {
  //     Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfileScreen()));
  //   }
  // }

  var dotPosition = 0;

  PromotionServiceApi promotionServiceApi = PromotionServiceApi();
  PromotionCategoryModel? readPromotionsCategory;
  List<DataPromotionCategory>? listPromotionCategory;

  PromotionModel? readPromotions;
  List<DataPromotion>? listPromotion;

  CouponModel? readCoupon;
  List<DataCoupon>? listCoupons;

  @override
  void initState() {
    super.initState();
    initList();
    // Future(_showDialog);
    fetchData();
  }

  void initList() async{
    //garageByService  = (await _serviceApi.readGarageBYServiceApi()) as List<GarageByService>?;
    readPromotionsCategory = await promotionServiceApi.readPromotionsCategory();
    listPromotionCategory = readPromotionsCategory?.payload;

    readPromotions = await promotionServiceApi.readPromotions();
    listPromotion = readPromotions?.payload;

    readCoupon = await promotionServiceApi.readPromotionCoupon();
    listCoupons = readCoupon?.payload;
    setState(() {
    });
  }


  final MainServiceApi _serviceApi = MainServiceApi();
  Future<MainServiceModel>? _mainServiceModel;

  void fetchData() async{
    _mainServiceModel = _serviceApi.readMainServiceApi();
  }


  // ignore: unu  sed_element
  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
            // ignore: avoid_unnecessary_containers
            contentPadding: const EdgeInsets.all(5),
            // backgroundColor: Colors.transparent,
            insetPadding: const EdgeInsets.symmetric(horizontal: 10),
            content: Stack(
              children: <Widget>[
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (_) =>  DetailAnnocement(assetImage: AppImages.assetAnnountcement)));
                  },
                  child: Container(
                    height:200,
                    width:MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppImages.assetAnnountcement), /// change this to your  image directory
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 0.0,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Align(
                      alignment: Alignment.topRight,
                      child: CircleAvatar(
                        radius: 14.0,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.close, color: Colors.grey),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if(listPromotionCategory == null || listPromotion == null){
      return Container(
        color: Colors.white,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      key: _key,
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => _key.currentState!.openDrawer(),
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        title: RichText(
          text: const TextSpan(
            text: "Auto",
            style: TextStyle( fontSize: 17,fontWeight:FontWeight.bold,color:Colors.black87,fontFamily: 'Quicksand'),
            children: [
              TextSpan(
                text: "Care",
                style: TextStyle(
                  color: Color(0xfffaca0b),
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const Notifications()));
              },
              icon: const Icon(
                Icons.notifications_none_outlined,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 15),
            CarouselWidget(
              height: 200,
              onPageChanged: (val, carouselPageChangedReason){
                setState(() {
                  dotPosition = val;
                });
              },
              items: carouselImage.map((i) {
                return Builder(
                  builder: (BuildContext context){
                    return GestureDetector(
                      onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (_) =>  DetailAnnocement(assetImage:i)));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(i),
                          ),
                          color: Colors.blue,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(
              height: 10,
            ),
            DotIndicatorWidget(
              dotsCount: carouselImage.isEmpty ? 3 : carouselImage.length,
              dotPosition: dotPosition.toDouble(),
            ),
            const SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap:(){
                     Navigator.push( context, MaterialPageRoute(builder: (_) => const HisstoryScreen()));
                  },
                  child: HomeMenu(
                    name: 'View History',
                    image: AppImages.historyImg,
                    color: const Color(0xFFff0066),
                  ),
                ),
                GestureDetector(
                  onTap:(){
                    Navigator.push(context, MaterialPageRoute( builder: (_) => const NewUIDesign(),));
                  },
                  child: HomeMenu(
                    name: 'Repair \nExspense',
                    image: AppImages.repairCostImg,
                    color: const Color.fromARGB(255, 228, 206, 7)
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap:(){
                    Navigator.push(context,MaterialPageRoute(builder: (_) => const CarReleventNewsScreen()));
                  },
                  child: HomeMenu(
                    name: 'News Letter',
                    image: AppImages.carReleventNews,
                    color: const Color.fromARGB(255, 0, 167, 153)
                  ),
                ),
                GestureDetector(
                  onTap:(){
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const Episode1()));
                  },
                  child: HomeMenu(
                    name: 'Account',
                    image: AppImages.profileImg,
                    color: const Color.fromARGB(255, 4, 167, 231)
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16,),
            Row(
               children: [
                //  Image.network('https://cdn-icons-png.flaticon.com/512/3199/3199306.png',width: 20,height:20),
                // SizedBox(width: 7),
                const Text('Main Service' , style: TextStyle( fontSize: 17,fontWeight:FontWeight.w400,color:Colors.grey )),
                const Spacer(),
                GestureDetector(
                   onTap:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ServiceScreen()));
                   },
                   child: Row(
                     children: const [
                        Text('View all',style: TextStyle(color: Colors.grey)),
                        Icon(Icons.arrow_forward_ios_rounded,color: grey,size: 15),
                     ],
                    ),
                  ),
               ],
             ),
            //  const SizedBox(height: 8,),
            //  FutureBuilder<MainServiceModel>(
            //   future: _mainServiceModel,
            //   builder: (context, snapshot) {
            //     if (snapshot.hasError) {
            //       return const Center(
            //         child: Text("Error read data from api"),
            //       );
            //     }
            //   if (snapshot.hasData) {
            //   var result = snapshot.data!.payload;
            //   return Container(
            //     decoration:const BoxDecoration(
            //     borderRadius: BorderRadius.only(
            //       topLeft: Radius.circular(20),
            //       topRight: Radius.circular(20),
            //     ),
            //     ),
            //       child: SizedBox(
            //         width: MediaQuery.of(context).size.width,
            //         child:GridView.count(
            //           physics: const BouncingScrollPhysics(),
            //           crossAxisCount:  3,
            //           shrinkWrap: true,
            //           childAspectRatio: 0.9,
            //           children: List.generate(
            //             6,
            //             (index) {
            //               // Category category = listCategorie[index];
            //               return ReuseListCardCategory(
            //                 getRandomColor:defaultColor,
            //                 title: "${result?[index].name}",
            //                 image: "${result?[index].img.toString()}",
            //                 onTap: () {
            //                   // Navigator.push(
            //                   //     context,
            //                   //     RouteAnimation(
            //                   //         enterPage: ListSubcategory(
            //                   //             categoryId: category.id,
            //                   //             urlImg: category.avatar,
            //                   //             categoryTitle:category.title,
            //                   //             )
            //                   // )
            //                   //);
            //                 },
            //               );
            //             },
            //           ),
            //         )
            //       )
            //     );
            //     }
            //     return SizedBox(
            //       width: MediaQuery.of(context).size.width,
            //       height: 200,
            //       child: const Center(
            //         child: CircularProgressIndicator(),
            //       ),
            //     );
            //   },
            // ),
            //-----------------------------------
            StylistCard(
              title:'Towing Service',
              url:'http://res.cloudinary.com/dxabrthe8/image/upload/v1653107649/Top-auto/MainService/nbmkuafcxqin1joof5hr.png',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const FindTowingSrvice()));
              },
            ),
            StylistCard(
              title:'Repair Garage',
              url:'http://res.cloudinary.com/dxabrthe8/image/upload/v1653107614/Top-auto/MainService/s1ncbhump8bbzhnpi0wv.png',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const GoogleMapScreen()));
              },
            ),
            // Row(
            //    mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //    children: [
            //      GestureDetector(
            //        onTap:(){
            //          Navigator.push( context, MaterialPageRoute(builder: (_) => const ServiceScreen()));
            //        },
            //        child: BBoxWidget(
            //           index: 0,
            //           color: const Color.fromARGB(255, 54, 135, 216),
            //           tag: 'Car Assistant \nService',
            //           name:'Car Assistant \nService',
            //           image:   AppImages.carServiceImg,
            //        ),
            //      ),
            //     //  const SizedBox(width: 5),
            //      GestureDetector(
            //        onTap:(){
            //          Navigator.push(context, MaterialPageRoute(builder: (_) => const GoogleMapScreen()));
            //        },
            //        child: BBoxWidget(
            //           index: 0,
            //           color: const Color.fromARGB(235, 5, 201, 152),
            //           tag: 'Find Repair \nGarage',
            //           name:'Find Repair \nGarage',
            //           image:   AppImages.repairService,
            //        ),
            //      ),
            //    ],
            //  ),
            const SizedBox(height: 8),
            // GestureDetector(
            //   onTap: (){
            //     Navigator.push(context, MaterialPageRoute(builder: (_) => const GoogleMapScreen()));
            //   },
            //   child: Container(
            //     height: 200,
            //     decoration: BoxDecoration(border: Border.all(
            //       width: 0.5,
            //       color: grey.withOpacity(0.3)),
            //       borderRadius: BorderRadius.circular(5),
            //         color:Colors.white,
            //     ),
            //     child: Column(
            //       children: [
            //         Container(
            //           width: MediaQuery.of(context).size.width,
            //           height: 150,
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(8),
            //             color:Colors.white,
            //             image: const DecorationImage(
            //               image: NetworkImage('https://t4.ftcdn.net/jpg/03/15/55/09/360_F_315550984_TdjVeVJ92WPbIBD53cGCSWWE590VvVtF.jpg'),
            //               fit: BoxFit.cover,
            //             ),
            //           ),
            //           // child: Image.network('https://www.freepnglogos.com/uploads/pin-png/flat-design-map-pin-transparent-png-stickpng-18.png',width: 20,height:20),
            //         ),
            //         Text(
            //             'Find Repair Garage',
            //             maxLines: 1,
            //             textAlign: TextAlign.center,
            //             softWrap: true,
            //             overflow: TextOverflow.fade,
            //             style: titleTextStyleBlack.copyWith(color:Colors.black54,fontSize: 20,fontWeight: FontWeight.w600
            //           ),
            //         )
            //       ],
            //     ),
            //   ),
            // ),
            // const SizedBox(height: 16),
            Row(
              children: [
                //  Image.network('https://cdn-icons-png.flaticon.com/512/3199/3199306.png',width: 20,height:20),
                // const SizedBox(width: 7),
                const Text('Hot Activities' , style:  TextStyle( fontSize: 17,fontWeight:FontWeight.w400,color:Colors.grey )),
                const Spacer(),
                GestureDetector(
                  onTap:(){
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => const Promotion()));
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
            const SizedBox(height: 16),
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
            // const SizedBox(height:16),
            Row(
              children: [
              //  Image.network('https://cdn-icons-png.flaticon.com/512/3728/3728890.png',width: 20,height:20),
              //  const SizedBox(width: 7),
               const Text('Hot Coupons' , style: TextStyle( fontSize: 17,fontWeight:FontWeight.w400,color:Colors.grey )),
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
             const SizedBox(height:16),
             SizedBox(
              height: 170,
              child: ListView.builder(
                itemCount: listCoupons!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                  // ignore: unused_local_variable
                  PandaPickItemModel model = PandaPickHelper.getStatusItem(index);
                  return Row(
                    children: [
                      SizedBox(
                        height: 170,
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 100,
                                  decoration:BoxDecoration(
                                    borderRadius:BorderRadius.circular(8),
                                    color:defaultColor.withOpacity(0.2),
                                     image: DecorationImage(
                                      fit: BoxFit.cover,
                                      // colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
                                      image: NetworkImage(listCoupons![index].img ?? '')
                                    )
                                  ),
                                  width: 260,
                                ),
                                Positioned(
                                  bottom: 5,
                                  left: 5,
                                  child: Container(
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: black.withOpacity(0.3),
                                            blurRadius: 20,
                                            offset: const Offset(5, 10),
                                          ),
                                        ],
                                        color: const Color(0xFFe0ebeb),
                                        borderRadius:  BorderRadius.circular(8)
                                      ),
                                      child:  Padding(
                                        padding:const  EdgeInsets.symmetric(vertical: 5,horizontal: 15),
                                        child: Text(listCoupons![index].location ?? '', style:const TextStyle(color: Colors.black87 , fontSize: 13,fontWeight: FontWeight.w500)),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            Container(
                              height: 50,
                              width: 260,
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
                                        Text('10/05/2022-15/05/2022',style: bodyTextStyleBlack.copyWith(fontWeight: FontWeight.w600,color: grey)),
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
                                          promotionServiceApi.addUserCoupon(couponId: listCoupons![index].sId ??'', userId: '6288a66fe3f41d04cd0ce922');
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
                      ),
                      const SizedBox(width: 10),
                    ],
                  );
                }
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // GridView.count(
            //   shrinkWrap: true,
            //   crossAxisCount: 2,
            //   physics: const NeverScrollableScrollPhysics(),
            //   children: List.generate(
            //     _mainBox.length,
            //     (index) => InkWell(
            //       onTap: () {
            //         navigate(index);
            //       },
            //       child: BBoxWidget(
            //         index: index,
            //         color: _mainBox[index].color,
            //         tag: _mainBox[index].name,
            //         name: _mainBox[index].name,
            //         image: _mainBox[index].image,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class HomeMenu extends StatelessWidget {
  final String? name;
  final Color? color;
  final String? image;
  const HomeMenu({
    Key? key,
    this.name,
    this.color,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width / 2.15,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 1),
        border: Border.all(
          width: 0.5,
          color: Colors.grey.withOpacity(0.3),
          //index == 0 || index == 1 || index == 3 ? defaultColor : Colors.grey.withOpacity(0.3)
        ),
        borderRadius:BorderRadius.circular(8),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          const SizedBox(width: 5),
          Container(
            width: 40,
            height: 40,
            padding: const EdgeInsets.all(3),
            decoration: const BoxDecoration(
              color: defaultColor,
              shape: BoxShape.circle,
            ),
            child: FittedBox(
              child: Image.asset(image!,width: 20, height: 20,color:Colors.white)
            ),
          ),
          const SizedBox(width: 5),
          Text(
            name!,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 16,
              // fontFamily: 'Vollkorn',
              fontWeight: FontWeight.w500,
              color:Colors.black87.withOpacity(0.8),
            ),
          ),
            const SizedBox(width: 5),
          ],
        ))
    );
  }
}
