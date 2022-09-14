import 'package:budget_tracker/widgets/add_transaction_dialog.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../models/transaction_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TransactionItem> items = [];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AddTransactionDialog(
                itemToAdd: (transactionItem) {
                  setState(() {
                    items.add(transactionItem);
                  });
                },
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SizedBox(
            width: screenSize.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.topCenter,
                  child: CircularPercentIndicator(
                    radius: screenSize.width / 4,
                    lineWidth: 10.0, // how thick the line is
                    percent: .5, // percent goes from 0 -> 1
                    backgroundColor: Colors.white,
                    center: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          "\$0",
                          style: TextStyle(
                              fontSize: 48, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Balance",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    progressColor: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 35),
                const Text(
                  "Items",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                ...List.generate(
                    items.length,
                    (index) => TransactionCard(
                          item: items[index],
                        )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TransactionCard extends StatelessWidget {
  final TransactionItem item;
  const TransactionCard({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5.0, top: 5.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.05),
              offset: const Offset(0, 25),
              blurRadius: 50,
            ),
          ],
        ),
        padding: EdgeInsets.all(15.0),
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Text(
              item.itemTitle,
              style: TextStyle(fontSize: 18),
            ),
            const Spacer(),
            Text((!item.isExpense ? "+" : "-") + item.amount.toString(),
                style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
