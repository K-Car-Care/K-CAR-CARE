// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_car_care_project/model/expense_models/expense_model.dart';
import 'package:k_car_care_project/screen/manage_expense_screen/add_expense_screen/add_expense_data_screen.dart';
import 'package:k_car_care_project/screen/manage_expense_screen/list_expense_by_category_screen.dart';

import '../../data/expense_apis/expense_api.dart';


class ExpenseListScreen extends StatefulWidget {
  const ExpenseListScreen({Key? key}) : super(key: key);

  @override
  _ExpenseListScreenState createState() => _ExpenseListScreenState();
}

class _ExpenseListScreenState extends State<ExpenseListScreen>
    with SingleTickerProviderStateMixin {
  final ExpenseApi _expenseApi = ExpenseApi();

  @override
  void initState() {
    _expenseApi.readListExpenseApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ExpenseModel>(
        future: _expenseApi.readListExpenseApi(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasData) {
            var expense = snapshot.data!.payload;
            return DefaultTabController(
              length: expense!.length,
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
                    scrollBehavior: ScrollBehavior(),
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
                            tabs: List.generate(
                              expense.length,
                              (index) {
                                return Tab(
                                  child: Text(
                                    index.toString(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ];
                    },
                    body: TabBarView(
                      children: List.generate(
                        expense.length,
                        (index) {
                          return ListExpenseByCategoryScreen();
                        },
                      ),
                    ),
                  ),
                ),
              ),
            );
          }

          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
