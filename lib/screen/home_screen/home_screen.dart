import 'package:flutter/material.dart';
import 'package:k_car_care_project/core/constant/app_images.dart';
import 'package:k_car_care_project/screen/detail_announcement/main_body.dart';
import 'package:k_car_care_project/screen/drawer_screen/main_drawer.dart';
import 'package:k_car_care_project/screen/google_map_screen/find_garage_map_screen.dart';
import 'package:k_car_care_project/screen/notification_screen/main_notification.dart';
import 'package:k_car_care_project/screen/promotion/main_body.dart';
import 'package:k_car_care_project/screen/redesign_expense_ui/main_body.dart';
import '../../core/constant/theme_constant.dart';
import '../../core/model/home_screen_model/home_screen_model.dart';
import '../../widget/b_box_widget.dart';
import '../../widget/carousel_widget.dart';
import '../../widget/dot_indicator_widget.dart';
import '../car_relevent_new_screen/car_relevent_news_screen.dart';
import '../history_screen.dart/main_history_screen.dart';
import '../profile_screen/main_profile_screen.dart';
import '../service_screen/main_servce.dart';
import '../test_profile.dart';

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

  // ignore: prefer_final_fields
  List<MainModel> _mainBox = [
    MainModel(
        name: 'View History',
        image: AppImages.historyImg,
        color: const Color(0xFFff0066)),
    MainModel(
        name: 'Repair Exspense',
        image: AppImages.repairCostImg,
        color: const Color(0xFFfea832)
      ),
    MainModel(
        name: 'News Letter',
        image: AppImages.carReleventNews,
        color: Color.fromARGB(255, 230, 19, 57)
      ),
    MainModel(
        name: 'Account',
        image: AppImages.profileImg,
        color: const Color(0xFF0F3EB6)
    ),
    MainModel(
        name: 'Car Assistant Service',
        image: AppImages.carServiceImg,
        color: Color.fromARGB(255, 54, 135, 216)
    ),
    MainModel(
        name: 'Find Repair \nGarage',
        image: AppImages.repairService,
        color: Color.fromARGB(235, 5, 201, 152)),
  ];

  navigate(int index) {
    if (_mainBox[index].name.toUpperCase() == "CAR ASSISTANT SERVICE".toUpperCase()) {
      Navigator.push( context, MaterialPageRoute(builder: (_) => const ServiceScreen()));
    } else if (_mainBox[index].name.toUpperCase() == "FIND REPAIR \nGARAGE".toUpperCase()) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => const GoogleMapScreen()));
    } else if (_mainBox[index].name.toUpperCase() == "REPAIR EXPENSE".toUpperCase()) {
      Navigator.push(context, MaterialPageRoute( builder: (_) => const NewUIDesign(),));
    } else if (_mainBox[index].name.toUpperCase() == "NEWS LETTER".toUpperCase()) {
      Navigator.push(context,MaterialPageRoute(builder: (_) => const CarReleventNewsScreen()));
    } else if (_mainBox[index].name.toUpperCase() == "VIEW HISTORY".toUpperCase()) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => const HisstoryScreen()));
    } else if (_mainBox[index].name.toUpperCase() == "account".toUpperCase()) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfileScreen()));
    }
  }

  var dotPosition = 0;
  @override
  void initState() {
    // Use either of them.
    // Future(_showDialog);
    super.initState();
  }

  // ignore: unused_element
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
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
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
            Row(
               children:const [
                //  Image.network('https://cdn-icons-png.flaticon.com/512/3199/3199306.png',width: 20,height:20),
                  // SizedBox(width: 7),
                  Text('General' , style: TextStyle( fontSize: 17,fontWeight:FontWeight.w400,color:Colors.grey )),
                //  const Spacer(),
                //  GestureDetector(
                //    onTap:(){
                //     // Navigator.push(context, MaterialPageRoute(builder: (context) => const Promotion(title:'Hot Productions')));
                //    },
                //    child: const Icon(Icons.arrow_forward_rounded,color: grey)
                //   )
               ],
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
               children: const [
                //  Image.network('https://cdn-icons-png.flaticon.com/512/3199/3199306.png',width: 20,height:20),
                // SizedBox(width: 7),
                Text('Main Service' , style: TextStyle( fontSize: 17,fontWeight:FontWeight.w400,color:Colors.grey )),
                //  const Spacer(),
                //  GestureDetector(
                //    onTap:(){
                //     // Navigator.push(context, MaterialPageRoute(builder: (context) => const Promotion(title:'Hot Productions')));
                //    },
                //    child: const Icon(Icons.arrow_forward_rounded,color: grey)
                //   )
               ],
             ),
             const SizedBox(height: 16,),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 GestureDetector(
                   onTap:(){
                     Navigator.push( context, MaterialPageRoute(builder: (_) => const ServiceScreen()));
                   },
                   child: BBoxWidget(
                      index: 0,
                      color: const Color.fromARGB(255, 54, 135, 216),
                      tag: 'Car Assistant \nService',
                      name:'Car Assistant \nService',
                      image:   AppImages.carServiceImg,
                   ),
                 ),
                //  const SizedBox(width: 5),
                 GestureDetector(
                   onTap:(){
                     Navigator.push(context, MaterialPageRoute(builder: (_) => const GoogleMapScreen()));
                   },
                   child: BBoxWidget(
                      index: 0,
                      color: const Color.fromARGB(235, 5, 201, 152),
                      tag: 'Find Repair \nGarage',
                      name:'Find Repair \nGarage',
                      image:   AppImages.repairService,
                   ),
                 ),
               ],
             ),
            const SizedBox(height: 16),
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
                    child: const Icon(Icons.arrow_forward_rounded,color: grey)
                    )
               ],
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SizedBox(
               height: MediaQuery.of(context).size.height * .278,
               child: ListView.builder(
                   itemCount: PandaPickHelper.itemCount,
                   scrollDirection: Axis.horizontal,
                   itemBuilder: (context, index){
                     PandaPickItemModel model = PandaPickHelper.getStatusItem(index);
                     return RestuarentScreen(
                       name: model.name,
                       image:model.image ,
                       remainingTime: model.remaingTime,
                       totalRating: model.totalRating,
                       subTitle: model.subTitle,
                       rating: model.ratting,
                       deliveryTime: model.remaingTime, deliveryPrice: model.deliveryPrice,
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
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => const Promotion()));
                 },
                 child: const Icon(Icons.arrow_forward_rounded,color: grey)
                )
             ],
            ),
             const SizedBox(height:16),
             SizedBox(
              height: 120,
              child: ListView.builder(
                  itemCount: PandaPickHelper.itemCount,
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
                           image: const DecorationImage(
                            fit: BoxFit.cover,
                              image: NetworkImage('https://www.wpbeginner.com/wp-content/uploads/2020/01/create-coupon-popup-wordpress-550x340-featured.png')
                          )
                        ),
                        width: 220,
                      ),
                    );
                  }),
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
            decoration: BoxDecoration(
              color: defaultColor.withOpacity(0.1),
              shape: BoxShape.circle,
              // image: DecorationImage(
              //   image: AssetImage(
              //     "$image",
              //   ),
              // ),
            ),
            child: FittedBox(
              child: Image.asset(image!,width: 20, height: 20,color:defaultColor)
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
