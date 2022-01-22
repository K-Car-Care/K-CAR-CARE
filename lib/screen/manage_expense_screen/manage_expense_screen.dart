// ignore_for_file: prefer_const_constructors, avoid_print
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_car_care_project/widget/chart_flutter.dart';

class ManageExpenseScreen extends StatefulWidget {
  const ManageExpenseScreen({Key? key}) : super(key: key);

  @override
  _ManageExpenseScreenState createState() => _ManageExpenseScreenState();
}

class _ManageExpenseScreenState extends State<ManageExpenseScreen> {
  int index1 = 0;
  int cout = 0;
  List<String> date = ["7-DAYS", "1-MONTH", "3-MONTHS", "1-YEAR"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff000000),
        title: Text("Manage Expense"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFFBFAFA),
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(2, 2),
                    color: Colors.black.withOpacity(.25),
                    blurRadius: 4,
                  ),
                  BoxShadow(
                    offset: const Offset(-1, -1),
                    color: Colors.black.withOpacity(.25),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ChartFlutter(
                    count: cout,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextButton(
                      onPressed: () {
                        print("Show more Data");
                      },
                      child: Text(
                        "Show More".toUpperCase(),
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff313FA0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFFBFAFA),
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(2, 2),
                    color: Colors.black.withOpacity(.25),
                    blurRadius: 4,
                  ),
                  BoxShadow(
                    offset: const Offset(-1, -1),
                    color: Colors.black.withOpacity(.25),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Last Records Overview",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            print("more vertical");
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Wrap(
                                  alignment: WrapAlignment.spaceEvenly,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: List.generate(
                                    date.length,
                                    (index) => InkWell(
                                      onTap: () {
                                        setState(() {
                                          index1 = index;
                                          cout = 4;
                                          Get.back();
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 50,
                                        ),
                                        child: Text(
                                          date[index],
                                          style: TextStyle(
                                            color: index1 == index
                                                ? Colors.blue
                                                : Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          icon: Icon(
                            Icons.more_vert_outlined,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Last 30 days".toUpperCase(),
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {
                            print("object");
                          },
                          leading: CircleAvatar(
                            backgroundColor: Color(0xff313FA0),
                            radius: 25,
                          ),
                          title: Padding(
                            padding: const EdgeInsets.only(bottom: 6.0),
                            child: Text(
                              "Change Oil",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          subtitle: Text(
                            "Cash",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(
                                "-\$100.00",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: Colors.red,
                                ),
                              ),
                              Text(
                                "3/10/2021",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => Divider(
                        color: Colors.grey,
                      ),
                      itemCount: 6,
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    TextButton(
                      onPressed: () {
                        print("Show more Data");
                      },
                      child: Text(
                        "Show More".toUpperCase(),
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff313FA0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
