import 'package:flutter/material.dart';
import '../models/transaction_item.dart';
import '../services/local_storage_service.dart';

class BudgetViewModel extends ChangeNotifier {
  double getBudget() => LocalStorageService().getBudget();

  double getBalance() => LocalStorageService().getBalance();

  List<TransactionItem> get items => LocalStorageService().getAllTransactions();

  set budget(double value) {
    LocalStorageService().saveBudget(value);
    notifyListeners();
  }

  void addItem(TransactionItem item) {
    final localStorage = LocalStorageService();
    localStorage.saveTransactionItem(item);
    notifyListeners();
  }

  void deleteItem(TransactionItem item) {
    final localStorage = LocalStorageService();
    localStorage.deleteTransactionItem(item);
    notifyListeners();
  }
}
