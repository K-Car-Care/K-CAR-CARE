
import 'package:flutter/material.dart';
import 'package:k_car_care_project/core/constant/theme_constant.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:k_car_care_project/screen/promotion/components/main_promotion.dart';
import 'package:transparent_image/transparent_image.dart';

class CategoryDetail extends StatefulWidget {
  

  const CategoryDetail({Key? key}) : super(key: key);

  @override
  _CategoryDetailState createState() => _CategoryDetailState();
}

class _CategoryDetailState extends State<CategoryDetail> {
  final _key = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _key,
      body: SafeArea(
          child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                const Positioned.fill(
                  child: Align(
                  alignment: Alignment.center,
                  child: Loading(), 
                )),
                Center(
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image:'https://toyota.com.my/media/image/attachment/696/loyalt-carousel-mobile-1.jpg',
                    fit: BoxFit.fill,
                    height: 400,
                    width: double.infinity,
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        // Box decoration takes a gradient
                        gradient: LinearGradient(
                          // Where the linear gradient begins and ends
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          // Add one stop for each color. Stops should increase from 0 to 1
                          colors: [
                            // Colors are easy thanks to Flutter's Colors class.
                            Colors.white.withOpacity(0.7),
                            Colors.white.withOpacity(0.5),
                            Colors.white.withOpacity(0.07),
                            Colors.white.withOpacity(0.05),
                            Colors.white.withOpacity(0.025),
                          ],
                        ),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Container())),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      height: 400,
                      decoration: BoxDecoration(
                        // Box decoration takes a gradient
                        gradient: LinearGradient(
                          // Where the linear gradient begins and ends
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          // Add one stop for each color. Stops should increase from 0 to 1
                          colors: [
                            // Colors are easy thanks to Flutter's Colors class.
                            Colors.white.withOpacity(0.8),
                            Colors.white.withOpacity(0.6),
                            Colors.white.withOpacity(0.6),
                            Colors.white.withOpacity(0.4),
                            Colors.white.withOpacity(0.07),
                            Colors.white.withOpacity(0.05),
                            Colors.white.withOpacity(0.025),
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                          child: Container()
                        )
                      ),
                ),
                Positioned(
                    bottom: 0,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const  [
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child:  Text(
                              'ALL PROMOTION CATEGPRIES',
                              style:  TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    )),
                Positioned(
                  right: 0,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () {
                        // changeScreen(context, CartScreen());
                      },
                      child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network('https://cdn-icons-png.flaticon.com/512/3728/3728890.png',width: 30,height:30),
                            ),
                          )),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.arrow_back,color:black)
                            ),
                          ))
                        ,
                    ),
                  ),
                ),
              ],
            ),

            Expanded(
              child: Container(
                decoration:const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white,
                          offset: Offset(2, 5),
                          blurRadius: 10)
                    ]),
                child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child:GridView.count(
                        physics: const BouncingScrollPhysics(),
                        crossAxisCount:  3,
                        shrinkWrap: true,
                        childAspectRatio: 1.1,
                        children: List.generate(
                          categories.length,
                          (index) {
                            // Category category = listCategorie[index];
                            return ReuseListCardCategory(
                              getRandomColor: ColorRandom.getRandomColor(),
                              image: categories[index]['img'],
                              title: categories[index]['name'],
                              onTap: () {
                                // Navigator.push(
                                //     context,
                                //     RouteAnimation(
                                //         enterPage: ListSubcategory(
                                //             categoryId: category.id,
                                //             urlImg: category.avatar,
                                //             categoryTitle:category.title,
                                //             )));
                              },
                            );
                          },
                        ),
                      )
                    )
              ),
            )         
          ],
        ),
      )),
    );
  }
}



class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: white,
        child: const SpinKitFadingCircle(
          color: black,
          size: 30,
        )
    );
  }
}