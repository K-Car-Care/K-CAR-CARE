import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:k_car_care_project/core/constant/theme_constant.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class Promotion extends StatefulWidget {
  final String title;
  const Promotion({Key? key, required this.title}) : super(key: key);

  @override
  _PromotionState createState() => _PromotionState();
}

class _PromotionState extends State<Promotion> {

  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: 'Search for restaurant,cuisones, and dishes');
  }

  @override
  Widget build(BuildContext context) {
    final height  = MediaQuery.of(context).size.height * 1 ;
    // ignore: unused_local_variable
    final width  = MediaQuery.of(context).size.width * 1 ;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        title:  Text(widget.title,style:const TextStyle(color:black)),
        // actions: const[
        //   Icon(Icons.shopping_bag_outlined,color:black),
        //   SizedBox(width: 10,)
        // ],
        bottom: PreferredSize(
          preferredSize:const Size.fromHeight(40),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15 , vertical: 10),
            child: Row(
              children:  [
                Expanded(child: CupertinoTextField(
                    controller: _textController,
                  padding: const  EdgeInsets.symmetric(vertical: 12 , horizontal: 10),
                  placeholder: "asdf",
                  prefix: const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Icon(Icons.search , color: Color(0xff7b7b7b) ,),
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xfff7f7f7),
                    borderRadius : BorderRadius.circular(50)
                  ),
                  style: const TextStyle(color: Color(0xff707070) ,
                      fontSize: 12) ,
                )),
                const SizedBox(width: 10,),
                const Icon(Icons.filter_list_outlined, color: black)
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15 , vertical: 10),
        child: SingleChildScrollView(
          child: SizedBox(
            height: height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Panda Pick' , style: TextStyle(color: Color(0xff323232) , fontSize: 15),),
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
               const  Text('Panda exclusives' , style: TextStyle(color: Color(0xff323232) , fontSize: 15),),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * .278,
                    child: ListView.builder(
                        itemCount: ExclusiveHelper.itemCount,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index){
                          ExclusiveItemModel model = ExclusiveHelper.getStatusItem(index);
                          return RestuarentScreen(
                            name: model.name,
                            image:model.image ,
                            remainingTime: model.remaingTime,
                            totalRating: model.totalRating,
                            subTitle: model.subTitle,
                            rating: model.rating,
                            deliveryTime: model.remaingTime, deliveryPrice: model.deliveryPrice,
                          );
                        }),
                  ),
                ),
                const Text('All Restuarent' , style: TextStyle(color: Color(0xff323232) , fontSize: 15),),

                Container(
                  height: 250,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ListView.builder(
                      itemCount: ExclusiveHelper.itemCount,
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index){
                        ExclusiveItemModel model = ExclusiveHelper.getStatusItem(index);
                        return RestuarentScreen(
                          name: model.name,
                          image:model.image ,
                          remainingTime: model.remaingTime,
                          totalRating: model.totalRating,
                          subTitle: model.subTitle,
                          rating: model.rating,
                          deliveryTime: model.remaingTime, deliveryPrice: model.deliveryPrice,
                        );
                      }),
                ),
                // SizedBox(height: 20,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class PandaPickItemModel {

  String name;
  String remaingTime;
  String deliveryPrice;
  String image;
  String ratting;
  String totalRating;
  String subTitle;

  PandaPickItemModel({ required this.name, required this.remaingTime ,required this.deliveryPrice , required this.image , required this.ratting , required this.subTitle ,required this.totalRating} );

}


class ExclusiveItemModel {

  String name;
  String remaingTime;
  String deliveryPrice;
  String image;
  String totalRating;
  String rating;
  String subTitle;

  ExclusiveItemModel({ required this.name, required this.remaingTime ,required this.deliveryPrice , required this.image , required this.totalRating , required this.subTitle, required this.rating} );

}



class ExclusiveHelper {

  static var exclusiveListModel = [
    ExclusiveItemModel( name: 'Burning Brownies', deliveryPrice: 'Free Delivery', remaingTime: '15 min', image: "https://cartimes.com.sg/images/upload/website%20banner.jpg", totalRating: '300', subTitle: 'Backery' , rating: '4.3'),
    ExclusiveItemModel( name: 'OPTP G11', deliveryPrice: '50', remaingTime: '35 min', image : "http://www.mybestcardealer.com/wp-content/uploads/2016/11/Toyota-Discount-November-Promotion-2016.jpg", totalRating: '400' , subTitle : 'Burgers' , rating: '4.7'),
    ExclusiveItemModel( name: 'China Town', deliveryPrice: '600', remaingTime: '20 min', image : "https://www.wardsauto.com/sites/wardsauto.com/files/styles/article_featured_retina/public/lexus%20ribbons%2020.jpg?itok=c2t_qW-B", totalRating: '560' , subTitle :"Chinees" , rating:'2.3'),
    ExclusiveItemModel( name: 'Burning Brownies', deliveryPrice: 'Free Delivery', remaingTime: '15 min', image: "https://www.web2carz.com/images/articles/201611/holiday_ad_1478791203_615x326.jpg", totalRating: '300', subTitle: 'Backery' , rating: '4.3'),
    ExclusiveItemModel( name: 'OPTP G11', deliveryPrice: '50', remaingTime: '35 min', image : "https://d1uxogwx374tr.cloudfront.net/geb-assets/uploads/2020/03/Free-Wash-Service-for-automotive-marketing.jpg", totalRating: '400' , subTitle : 'Burgers' , rating: '4.7'),
    ExclusiveItemModel( name: 'China Town', deliveryPrice: '600', remaingTime: '20 min', image : "https://d1uxogwx374tr.cloudfront.net/geb-assets/uploads/2020/03/Giveaway-promotional-idea.jpg", totalRating: '560' , subTitle :"Chinees" , rating:'2.3'),

  ];

  static ExclusiveItemModel getStatusItem(int position) {
    return exclusiveListModel[position];
  }

  static var itemCount = exclusiveListModel.length;

}



class PandaPickHelper {

  static var statusList = [
    PandaPickItemModel( name: 'New York Pizza', deliveryPrice: '90', remaingTime: '30 min', image: "https://lyhourleasing.com/wp-content/uploads/2021/08/New-Promotion-webside-01.png", ratting: '4.8', subTitle: 'New York', totalRating: '1.2k'),
    PandaPickItemModel( name: 'Burger Lab', deliveryPrice: '50', remaingTime: '25 min', image : "https://www.prasac.com.kh/wp-content/uploads/2018/12/Car_Loan_banner_sharing.png", ratting: '4.2' , subTitle : 'Burgers', totalRating: '230'),
    PandaPickItemModel( name: 'Jans Delights', deliveryPrice: '600', remaingTime: '20 min', image : "https://mytukar.com/blog/wp-content/uploads/2021/11/BLOG-ARTICLE-VISUAL_1200X630-1024x538.png", ratting: '2.5' , subTitle :"Pakistani", totalRating: '400'),
    PandaPickItemModel( name: 'New York Pizza', deliveryPrice: '90', remaingTime: '30 min', image: "https://carloans411.ca/images/icon.png", ratting: '4.8', subTitle: 'New York', totalRating: '1.2k'),
    PandaPickItemModel( name: 'Burger Lab', deliveryPrice: '50', remaingTime: '25 min', image : "https://dealerinspire1.s3.us-east-1.amazonaws.com/LDy-B%2Bt9sWrIrAqVPCE86A%3D%3D/CDy2BvBgoiXPo024IA%3D%3D/Vm3qUg%3D%3D/BSq5EP0jsmzRrEOzNA%3D%3D/header.jpg", ratting: '4.2' , subTitle : 'Burgers', totalRating: '230'),
    PandaPickItemModel( name: 'Jans Delights', deliveryPrice: '600', remaingTime: '20 min', image : "https://d1uxogwx374tr.cloudfront.net/geb-assets/uploads/2020/03/Free-Wash-Service-for-automotive-marketing.jpg", ratting: '2.5' , subTitle :"Pakistani", totalRating: '400'),
  ];

  static PandaPickItemModel getStatusItem(int position) {
    return statusList[position];
  }

  static var itemCount = statusList.length;

}



class RestuarentScreen extends StatefulWidget {
  final String name, image , remainingTime , subTitle, rating, deliveryTime , totalRating, deliveryPrice;
  const RestuarentScreen({Key? key,required this.name ,required this.image,required this.remainingTime ,
    required this.rating , required this.deliveryTime, required this.totalRating , required this.subTitle , required this.deliveryPrice  }) : super(key: key);

  @override
  _RestuarentScreenState createState() => _RestuarentScreenState();
}

class _RestuarentScreenState extends State<RestuarentScreen> {
  @override
  Widget build(BuildContext context) {
    final height  = MediaQuery.of(context).size.height * 1 ;
    final width  = MediaQuery.of(context).size.width * 1 ;
    return InkWell(
      onTap: (){
        //Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(name: widget.name, image: widget.image)));
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: SizedBox(
          height: height * .3,
          width: width * .6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image(
                          fit: BoxFit.cover,
                          height: height * .2,
                          image: NetworkImage(widget.image))),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: defaultColor,
                          borderRadius:  BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          )
                      ),
                      child:  const Padding(
                        padding: EdgeInsets.only(top: 7, left: 5 , right: 10, bottom: 7),
                        child: Text("Flash 20% OFF" , style: TextStyle(color: Colors.white , fontSize: 10),),
                      ),

                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 10 ,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xfffffcff),
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        child:  Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Text(widget.remainingTime , style: const TextStyle(color: black , fontSize: 12, ),),
                        ),

                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5  ,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.name , style: const TextStyle(color: Color(0xff323232) , fontSize: 14),),
                  Row(
                    children: [
                      RatingBarIndicator(
                        rating: 2.75,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 1,
                        itemSize: 19.0,
                        direction: Axis.horizontal,
                      ),
                      Text(" "+widget.rating , style: const TextStyle(color: Color(0xff323232) , fontSize: 12),),
                      Text("  ("+widget.totalRating+")" , style: const TextStyle(color: Color(0xffa9a9a9) ,fontSize: 12),),

                    ],
                  )
                ],
              ),
              const SizedBox(height: 3,), const SizedBox(height: 3,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.directions_bike , size: 14  , color: primary),
                  Text("\t" + widget.deliveryPrice + "m\taway", style: const TextStyle(color: Color(0xff707070) ,fontSize: 12),),

                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}