import 'package:finance_app/app/core/utils/constants.dart';
import 'package:finance_app/app/models/expense_model.dart';

class GroupModel {
  int id;
  double spendingLimit;
  String title;
  List<ExpenseModel> expenses;

  GroupModel({
    int? id,
    this.spendingLimit = 0,
    required this.title,
    required this.expenses,
  }) : id = id ?? Constants.uid();

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      "spending_limit": spendingLimit,
      "title": title,
      "expenses": expenses.map((ExpenseModel e) => e.toMap()).toList(),
    };
  }

  factory GroupModel.fromMap(Map<String, dynamic> map) {
    return GroupModel(
      id: map['id'],
      spendingLimit: map["spending_limit"],
      title: map["title"],
      expenses: List<ExpenseModel>.from(
          map["expenses"]?.map((e) => ExpenseModel.fromMap(e))),
    );
  }

  double totalAmountExpenses() {
    if (expenses.isEmpty) return 0.0;
    final prices = expenses.map((e) => e.price);
    return prices.reduce((a, b) => a + b);
  }
}
