
import 'package:flutter/material.dart';

class DetailServicePage extends StatefulWidget {
  const DetailServicePage({Key? key}) : super(key: key);

  @override
  _DetailServicePageState createState() => _DetailServicePageState();
}

class _DetailServicePageState extends State<DetailServicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: size.height * 0.5,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage("https://www.thespruce.com/thmb/ym-TWMW_UinzFx5fZtlQup_hDew=/1885x1414/smart/filters:no_upscale()/Car-garage-GettyImages-528098460-58a1fba93df78c475869ff29.jpg"),
                  fit: BoxFit.cover),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_rounded),
                        onPressed: (){Navigator.pop(context);
                        }
                      ,)
                    ),
                    // Row(
                    //   children: <Widget>[
                    //     IconButton(icon:const Icon(Icons.search_rounded),onPressed: (){Navigator.pop(context);},),
                    //     // const SizedBox(
                    //     //   width: 20,
                    //     // ),
                    //     IconButton(icon:const Icon(Icons.notifications_rounded),onPressed: (){Navigator.pop(context);},)
                    //   ],
                    // )
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: size.height * 0.45),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(50)),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  
                  Align(
                    child: Container(
                      width: 150,
                      height: 7,
                      decoration: BoxDecoration(
                          color: Colors.red[50],
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "10 best interior ideas for your\nliving room",
                    style: TextStyle(fontSize: 20, height: 1.5),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://images.unsplash.com/photo-1521572267360-ee0c2909d518?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80"),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const[
                           Text(
                            "Jean-Luis",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            "Interior Design",
                            style: TextStyle(fontSize: 13),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(3)),
                        child: const Padding(
                          padding: EdgeInsets.all(6.0),
                          child: Text("Interior"),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(3)),
                        child: const Padding(
                          padding: EdgeInsets.all(6.0),
                          child: Text("40m2"),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(3)),
                        child: const Padding(
                          padding: EdgeInsets.all(6.0),
                          child: Text("Ideas"),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20,),
                  const Text("Nobody wants to stare at a blank wall all day long, which is why wall art is such a crucial step in the decorating process. And once you start brainstorming, the rest is easy. From gallery walls to DIY pieces like framing your accessories and large-scale photography, we've got plenty of wall art ideas to spark your creativity. And where better to look for inspiration that interior designer-decorated walls",style: TextStyle(
                    height: 1.6
                  ),),
                  const SizedBox(height: 20,),
                  const Text("Gallery",style: TextStyle(
                    fontSize: 18
                  ),),
                  const SizedBox(height: 20,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                                      child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(image: AssetImage("assets/images/image_2.png"),fit: BoxFit.cover)
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image:const DecorationImage(image: AssetImage("assets/images/image_3.png"),fit: BoxFit.cover)
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image:const DecorationImage(image: AssetImage("assets/images/image_4.png"),fit: BoxFit.cover)
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}