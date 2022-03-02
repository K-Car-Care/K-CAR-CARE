// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:k_car_care_project/model/expense_models/expense_model.dart';
import 'package:k_car_care_project/widget/t_expense_widget.dart';

import '../../data/expense_apis/expense_api.dart';

class ListExpenseByCategoryScreen extends StatefulWidget {
  const ListExpenseByCategoryScreen({Key? key}) : super(key: key);

  @override
  _ListExpenseByCategoryScreenState createState() =>
      _ListExpenseByCategoryScreenState();
}

class _ListExpenseByCategoryScreenState
    extends State<ListExpenseByCategoryScreen> {
  final ExpenseApi _expenseApi = ExpenseApi();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ExpenseModel>(
        future: _expenseApi.readListExpenseApi(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error List Expense"),
            );
          }
          if (snapshot.hasData) {
            var expense = snapshot.data!.payload;
            return ListView.builder(
              itemCount: expense?.length,
              itemBuilder: (context, index) {
                return TExpenseWidget(
                  title: expense![index].type ??
                      expense[index].serviceId!.name.toString(),
                  subtitle: expense[index].type ??
                      expense[index].serviceId!.name.toString(),
                  price:
                      "${expense[index].price!.dollar ?? expense[index].price!.riel}",
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtw3RzkM_Es2hY9AW4HABNj1AX1GMcchllqZL8glR8b9-ypZbNqFzq0QXqkbRZ7qRuhfc&usqp=CAU",
                    ),
                    fit: BoxFit.fill,
                  ),
                );
              },
            );
          }
          return Container();
        });
  }
}
