import 'package:flutter/material.dart';
//import 'package:percent_indicator/percent_indicator.dart';

class TransactionItem extends StatelessWidget {
  String itemTitle;
  double amount;
  bool isExpense;

  TransactionItem({
    required this.itemTitle,
    required this.amount,
    this.isExpense = true,
    });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}