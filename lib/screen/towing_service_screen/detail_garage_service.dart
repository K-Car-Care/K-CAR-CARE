import 'package:flutter/material.dart';
import 'package:k_car_care_project/core/shared/typography.dart';

import '../../core/constant/theme_constant.dart';
import '../google_map_screen/find_garage_map_screen.dart';

class GarageDetail extends StatefulWidget {
  const GarageDetail({ Key? key }) : super(key: key);

  @override
  _GarageDetailState createState() => _GarageDetailState();
}

class _GarageDetailState extends State<GarageDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 2.5,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage('https://t4.ftcdn.net/jpg/03/15/55/09/360_F_315550984_TdjVeVJ92WPbIBD53cGCSWWE590VvVtF.jpg'),
                  fit: BoxFit.fill),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 10),
                child: Row(
                  mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    buildIcon(
                      iconData: Icons.arrow_back,
                      onTap: () => Navigator.pop(context),
                    ),
                    // buildIcon(
                    //     iconData: Icons.search,
                    //     onTap: () => Navigator.push(
                    //         context,
                    //         RouteAnimation(
                    //             enterPage: SearchGlobal()))),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top:MediaQuery.of(context).size.height/ 3.2),
            width: double.infinity,
            height: double.infinity,
            decoration:const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Hello World',style: titleTextStyleBlack.copyWith(fontWeight: FontWeight.w600),),
                    ListTile(
                      contentPadding:const EdgeInsets.all(0),
                      minLeadingWidth:5,
                      leading: const Icon(Icons.phone_forwarded_rounded),
                      title: Text('Hello World',style: subTitleTextStyleBlack.copyWith(),),
                    ),
                    ListTile(
                      contentPadding:const EdgeInsets.all(0),
                      minLeadingWidth:5,
                      leading: const Icon(Icons.location_on_rounded),
                      title: Text('Hello World',style: subTitleTextStyleBlack.copyWith(),),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_) => const GoogleMapScreen()));
                      },
                      child: Container(
                        height: 180,
                        decoration: BoxDecoration(border: Border.all(
                          width: 0.5,
                          color: grey.withOpacity(0.3)),
                          borderRadius: BorderRadius.circular(5),
                            color:Colors.white,
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 130,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color:Colors.white,
                                image: const DecorationImage(
                                  image: NetworkImage('https://t4.ftcdn.net/jpg/03/15/55/09/360_F_315550984_TdjVeVJ92WPbIBD53cGCSWWE590VvVtF.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              // child: Image.network('https://www.freepnglogos.com/uploads/pin-png/flat-design-map-pin-transparent-png-stickpng-18.png',width: 20,height:20),
                            ),
                            // ListTile(
                            //   contentPadding:const EdgeInsets.all(0),
                            //   minLeadingWidth:5,
                            //   leading: const Icon(Icons.location_on_rounded),
                            //   title: Text('Find Repair Garage',
                            //       maxLines: 1,
                            //       textAlign: TextAlign.start,
                            //       softWrap: true,
                            //       overflow: TextOverflow.fade,
                            //       style: titleTextStyleBlack.copyWith(color:Colors.black54,fontSize: 20,fontWeight: FontWeight.w600
                            //     ),
                            //   )
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      )
                      
    );
  }

  Widget buildIcon({VoidCallback? onTap, IconData? iconData}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(5),
          // alignment: Alignment.center,
          child: Icon(iconData, color: Colors.black)),
    );
  }
}
