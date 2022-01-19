// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_car_care_project/screen/manage_expense_screen/add_expense_screen/add_expense_data_screen.dart';
import 'package:k_car_care_project/screen/manage_expense_screen/tab_expense_screen.dart';

class ExpenseListScreen extends StatefulWidget {
  const ExpenseListScreen({Key? key}) : super(key: key);

  @override
  _ExpenseListScreenState createState() => _ExpenseListScreenState();
}

class _ExpenseListScreenState extends State<ExpenseListScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: Color(
              0xff0F3EB6,
            ),
            onPressed: () {
              Get.to(
                () => AddExpenseDataScreen(),
              );
            },
            child: Icon(Icons.add),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    // collapsedHeight: 70,
                    title: Text(
                      'Manage Expense',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    leading: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.arrow_back),
                      color: Colors.black,
                    ),
                    pinned: true,
                    floating: true,
                    bottom: TabBar(
                      physics: BouncingScrollPhysics(),
                      indicator: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(50), // Creates border
                        border: Border.all(
                          color: Color(
                            0xff0F3EB6,
                          ),
                        ),
                      ),
                      indicatorSize: TabBarIndicatorSize.tab,
                      isScrollable: true,
                      unselectedLabelColor: Colors.black,
                      labelColor: Color(0xff0F3EB6),
                      tabs: [
                        Tab(child: Text('Oil Change')),
                        Tab(child: Text('Tire Rotation')),
                        Tab(child: Text('Brake')),
                        Tab(child: Text('Filter')),
                        Tab(child: Text('Inspection')),
                      ],
                    ),
                  ),
                ];
              },
              body: Padding(
                padding: const EdgeInsets.only(top: 14.0),
                child: TabBarView(
                  children: <Widget>[
                    TabExpenseScreen(),
                    TabExpenseScreen(),
                    TabExpenseScreen(),
                    TabExpenseScreen(),
                    TabExpenseScreen(),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
