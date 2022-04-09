import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:k_car_care_project/core/constant/app_images.dart';
import 'package:k_car_care_project/core/constant/theme_constant.dart';
import 'package:k_car_care_project/core/shared/typography.dart';
import 'package:k_car_care_project/screen/redesign_expense_ui/json/daily_json.dart';

class ListExpenseCategory extends StatefulWidget {
  const ListExpenseCategory({Key? key}) : super(key: key);

  @override
  State<ListExpenseCategory> createState() => _ListExpenseCategoryState();
}

class _ListExpenseCategoryState extends State<ListExpenseCategory> {
  final Color color1 = const Color.fromRGBO(124, 220, 149, 1);

  final Color color2 = const Color.fromRGBO(33, 207, 184, 1);

  final Color backgroundColor = const Color.fromRGBO(241, 240, 246, 1);

  Container circle() {
    return Container(
      height: 240,
      width: 240,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white10,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        slivers: [
          // 1) Creating Custom AppBar
          SliverToBoxAdapter(
            child: Stack(
              children: [
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [color1, color2],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Positioned(
                  // hit and trail
                  top: -100,
                  left: -100,
                  child: circle(),
                ),
                Positioned(
                  // hit and trail
                  bottom: -120,
                  right: -70,
                  child: circle(),
                ),
                Positioned(
                  // hit and trail
                  bottom: -50,
                  right: -170,
                  child: circle(),
                ),
                Positioned(
                  // hit and trail
                  bottom: 130,
                  right: 110,
                  left: 100,
                  child: circle(),
                ),
                // 1.1) Creating avatar
                const Positioned(
                  top: 50,
                  right: 15,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage('https://expertphotography.b-cdn.net/wp-content/uploads/2018/10/cool-profile-pictures-retouching-1.jpg'),
                  ),
                ),
                // 1.2) Creating button
                Positioned(
                  top: 50,
                  left: 15,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back,color:white),
                    onPressed:(){
                      Navigator.pop(context);
                    }
                  ),
                ),
                // 1.3) Creating amount display
                Positioned(
                  right: 15,
                  bottom: 50,
                  child: Text(
                    "Total Balance to spend",
                    style: bodyTextStyleWhite.copyWith(fontWeight: FontWeight.w600,fontSize: 16)
                  ),
                ),
                // 1.4) Creating amount
                Positioned(
                  right: 15,
                  bottom: 5,
                  child: Text(
                    "\$5785.55",
                    style: titleTextStyleWhite.copyWith(fontWeight: FontWeight.w600,fontSize:30),
                  ),
                ),
              ],
            ),
          ),
          // 2) Creating section title
           SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverToBoxAdapter(
              child: Text("Towing Expenses",style:subTitleTextStyleBlack.copyWith(fontWeight: FontWeight.w600)),
            ),
          ),
          // 3) Horizontal Cards list
          SliverPadding(
            padding: const EdgeInsets.all(0),
            sliver: SliverToBoxAdapter(
              child: SizedBox(
                height:MediaQuery.of(context).size.height,
                child: ListView.builder(
                  padding:EdgeInsets.zero,
                  itemCount: daily.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 8),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: (size.width - 40) * 0.7,
                          child: Row(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey.withOpacity(0.1),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    AppImages.assetCarExpense,
                                    width: 35,
                                    height: 35,
                                    //  color:,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                              SizedBox(
                                width: (size.width - 90) * 0.5,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      daily[index]['name'].toUpperCase(),
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: black.withOpacity(0.8),
                                          fontWeight: FontWeight.w500),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      daily[index]['date'],
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: black.withOpacity(0.5),
                                          fontWeight: FontWeight.w400),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          //  width: (size.width - 40) * 0.1,
                          child: Text(
                            "${daily[index]['price']}",
                            style:  TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: const Color(0xffFF5771).withOpacity(0.7)),
                          ),
                        )
                      ],
                    ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  final String actionText;

  const SectionHeader({
    Key? key,
    required this.title,
    required this.actionText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            Text(actionText),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_right_rounded,
              ),
            ),
          ],
        ),
      ],
    );
  }
}



      // 7) Creating bottom navigation
      // bottomNavigationBar: BottomNavigationBar(
      //   // By default bottom navigation bar donot show more than 3 items
      //   type: BottomNavigationBarType.fixed,
      //   backgroundColor: Colors.white,
      //   selectedItemColor: color2,
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.wallet_membership_outlined,
      //       ),
      //       label: "Spend",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         CupertinoIcons.heart,
      //       ),
      //       label: "Save",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.calendar_today),
      //       label: "Schedule",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.menu,
      //       ),
      //       label: "Menu",
      //     ),
      //     BottomNavigationBarItem(
      //       label: "",
      //       icon: Container(
      //         height: 50,
      //         width: 50,
      //         decoration: BoxDecoration(
      //           shape: BoxShape.circle,
      //           gradient: LinearGradient(
      //             colors: [color1, color2],
      //             begin: Alignment.topCenter,
      //             end: Alignment.bottomCenter,
      //           ),
      //         ),
      //         child: Icon(
      //           Icons.add,
      //           color: Colors.white,
      //         ),
      //       ),
      //     ),
      //   ],
      // ),