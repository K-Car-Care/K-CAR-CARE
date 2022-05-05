import 'package:flutter/material.dart';
import 'package:k_car_care_project/core/constant/app_images.dart';
import 'package:k_car_care_project/core/constant/theme_constant.dart';
import 'package:k_car_care_project/core/provider/state_change_notifier.dart';
import 'package:provider/provider.dart';
import 'components/add_expense_data_screen.dart';
import 'json/budget_json.dart';
import 'json/daily_json.dart';
import 'json/day_month.dart';
import 'package:fl_chart/fl_chart.dart';
import 'list_expense/main_body.dart';
import 'list_expense_category/main_body.dart';

class NewUIDesign extends StatefulWidget {
  const NewUIDesign({Key? key}) : super(key: key);

  @override
  _NewUIDesignState createState() => _NewUIDesignState();
}

class _NewUIDesignState extends State<NewUIDesign> {
  int activeDay = 3;
  int? touchedIndex;

  final Color color1 = const Color(0xffFFC145);
  final Color color2 = const Color(0xffFFE538);

  double height = .55;
  double opacity = .9;

  void addTransaction() {
    setState(() {
      height = .08;
      opacity = 1;
    });
  }

  void done() {
    setState(() {
      height = .55;
      opacity = 9;
    });
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final stateNotifier = Provider.of<StateChangeNotifier>(context);
    touchedIndex = Provider.of<StateChangeNotifier>(context).legendIndex;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0.0,
      //   automaticallyImplyLeading: false,
      //   centerTitle: false,
      //   title: Text(
      //     "Budget",
      //     style: TextStyle(
      //         fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
      //   ),
      //   actions: [
      //     Icon(Icons.add, size: 25, color: Colors.black),
      //     SizedBox(
      //       width: 20,
      //     ),
      //     // Icon(AntDesign.search1,size: 25, color:Colors.black)
      //   ],
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
        Container(
          decoration: BoxDecoration(color: white, boxShadow: [
            BoxShadow(
              color: grey.withOpacity(0.01),
              spreadRadius: 10,
              blurRadius: 3,
              // changes position of shadow
            ),
          ]),
          child: Padding(
            padding: const EdgeInsets.only(top: 40, right: 10, left: 10, bottom: 25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                    icon: const Icon(Icons.arrow_back,color:black),
                    onPressed:(){
                        Navigator.pop(context);
                      }
                    ),
                    const Text(
                      "Car Expense",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: black),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=> const ListAllExpense()));
                      },
                      child: Image.asset(AppImages.assetListExpense,width: 30,height: 30,)
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(months.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            activeDay = index;
                          });
                        },
                        child: SizedBox(
                          width: (MediaQuery.of(context).size.width - 40) / 6,
                          child: Column(
                            children: [
                              Text(
                                months[index]['label'],
                                style: const TextStyle(fontSize: 10),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: activeDay == index
                                      ? const Color.fromARGB(255, 252, 208, 121)
                                      : black.withOpacity(0.02),
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: activeDay == index
                                        ? const Color.fromARGB(255, 252, 208, 121)
                                        : black.withOpacity(0.1))),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12, right: 12, top: 7, bottom: 7),
                                  child: Text(
                                    months[index]['day'],
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                        color:
                                            activeDay == index ? white : black),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }
                  )
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        //---------------------------
        SizedBox(
            height: 110,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: budget_json.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_)=> const ListExpenseCategory()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              width: 0.5, color: Colors.grey.withOpacity(0.2)),
                          color: white,
                        ),
                        width: MediaQuery.of(context).size.width -
                            (MediaQuery.of(context).size.width / 4),
                        height: 130,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                budget_json[index]['name'].toUpperCase(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    color:
                                        const Color(0xff67727d).withOpacity(0.6)),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        budget_json[index]['price'],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 3),
                                        child: Text(
                                          budget_json[index]['label_percentage'],
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13,
                                              color: const Color(0xff67727d)
                                                  .withOpacity(0.6)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 3),
                                    child: Text(
                                      "\$5000.00",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                          color: const Color(0xff67727d)
                                              .withOpacity(0.6)),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Stack(
                                children: [
                                  Container(
                                    width: (size.width - 40),
                                    height: 4,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.grey.withOpacity(0.1)),
                                  ),
                                  Container(
                                    width: (size.width - 40) *
                                        budget_json[index]['percentage'],
                                    height: 4,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: budget_json[index]['color']),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                })),
        // ------------------------
        Container(
          height: 250.0,
          padding:const EdgeInsets.all(16),
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
              border: Border.all(width: 0.5, color: Colors.grey.withOpacity(0.2)),
              color: white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(
                  color: grey.withOpacity(0.01),
                  spreadRadius: 10,
                  blurRadius: 3,
                  // changes position of shadow
                ),
              ]),
          child: Center(
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: PieChart(
                    PieChartData(
                      // pieTouchData:  PieTouchData(touchCallback: (pieTouchResponse) {
                      // setState(() {
                      //   if (pieTouchResponse.touchInput is FlLongPressEnd || pieTouchResponse.touchInput is FlPanEnd) {
                      //     touchedIndex = -1;
                      //   } else {
                      //     touchedIndex = pieTouchResponse.touchedSectionIndex;
                      //   }
                      // });
                      // }),
                      centerSpaceRadius: 50.0,
                      sections: showCategories(touchedIndex,context),
                      sectionsSpace: 0.0,
                      centerSpaceColor: Colors.white,
                      borderData: FlBorderData(
                        show: false,
                      ),
                      pieTouchData: PieTouchData(touchCallback: (fBorderData, pieTouchResponse) {
                        setState(() {
                          // if (pieTouchResponse.touchedSection is FlLongPressEnd || pieTouchResponse.touchInput is FlPanEnd) {
                          //   touchedIndex = -1;
                          // } else {
                          //   touchedIndex = pieTouchResponse.touchedSectionIndex;
                          // }
                        });
                      }),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Text(
                          "05",
                          textScaleFactor: 2,
                        ),
                        Text("Expenses".toUpperCase())
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 5.0),
        Container(
          margin:const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(width: 0.5, color: Colors.grey.withOpacity(0.2)),
              boxShadow: [
                BoxShadow(
                  color: grey.withOpacity(0.01),
                  spreadRadius: 10,
                  blurRadius: 3,
                  // changes position of shadow
                ),
              ]), // margin: const EdgeInsets.all(8),
          child: Column(
              children: List.generate(daily.length, (index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_)=> const ListExpenseCategory()));
              },
              child: Container(
                // margin: const EdgeInsets.only(left: 8, right: 8,top:8),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: stateNotifier.legendIndex == index
                    ? const Color(0xFFFFF8E5).withOpacity(0.5)
                    : white,
                ),
                child: Column(
                  children: [
                    Row(
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
                    //  Divider(
                    //    thickness: 0.8,
                    //  )
                  ],
                ),
              ),
            );
          }
          )
        ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          height:70,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 80),
                  child: Text(
                    "Total".toUpperCase(),
                    style: TextStyle(
                        fontSize: 16,
                        color: grey.withOpacity(0.8),
                        fontWeight: FontWeight.w600),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Text(
                    "\$1780.00",
                    style: TextStyle(fontSize: 20,color: Color(0xffFF5771), fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
        // const SizedBox(height: 20)
      ]
      )
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              useRootNavigator: true,
              isScrollControlled: true,
              context: context,
              clipBehavior: Clip.antiAlias,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(24),
                  ),
                ),
                builder:(context) => SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: NewTransaction(
                        opacity: opacity,
                        done: done,
                      ),
                  ),
                ),
              );
          },
          child:  Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [color1, color2],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          backgroundColor: color1,
        ),
    );
  }
}

List monthsfilter = [
  {"label": "2018", "day": "Jan"},
  {"label": "2018", "day": "Feb"},
  {"label": "2018", "day": "Mar"},
  {"label": "2018", "day": "Apr"},
  {"label": "2018", "day": "May"},
  {"label": "2018", "day": "Jun"},
];

class CostsData {
  final String category;
  final int cost;
  final Color color;
  const CostsData(this.category, this.cost, this.color);
}

List<PieChartSectionData> showCategories(touchedIndex,context) {
  return List.generate(4, (index) {
    final isTouched = index == touchedIndex;
    final double fontSize = isTouched ? 18 : 16;
    final double radius = isTouched ? 70 : 60;
    final stateNotifier = Provider.of<StateChangeNotifier>(context);
    switch (index) {
      case 0:
        return PieChartSectionData(
            color: Color.fromARGB(255, 252, 208, 121),
            value: 53,
            title: "53%",
            radius: radius,
            badgeWidget: GestureDetector(
              onTap:(){
                stateNotifier.setLegendIndex(index);
              }
            ),
            titleStyle: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold,color:white));

      case 1:
        return PieChartSectionData(
            color: const Color(0xff1C85FF),
            value: 18,
            title: "18%",
            badgeWidget: GestureDetector(
              onTap:(){
                // ignore: avoid_print
                print("index$index");
                stateNotifier.setLegendIndex(index);
              }
            ),
            radius: radius,
            titleStyle: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold,color:white));

      case 2:
        return PieChartSectionData(
            color: const Color(0xffFF5771),
            value: 17,
            title: "17%",
            radius: radius,
            badgeWidget: GestureDetector(
              onTap:(){
                // ignore: avoid_print
                print("index$index");
                stateNotifier.setLegendIndex(index);
              }
            ),
            titleStyle:TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold,color:white));

      case 3:
        return PieChartSectionData(
            color: const Color(0xff3CD1A2),
            value: 12,
            title: "12%",
            badgeWidget: GestureDetector(
              onTap:(){
                // ignore: avoid_print
                print("index$index");
                stateNotifier.setLegendIndex(index);
              }
            ),
            radius: radius,
            titleStyle:TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold,color:white));
      default:
        return PieChartSectionData();
    }
  });
}

TextStyle smallTitleStyle = const TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0);
