import 'package:finance_app/app/models/expense_model.dart';

class GroupModel {
  double price;
  String title;
  List<ExpenseModel> expenses;

  GroupModel({
    required this.price,
    required this.title,
    required this.expenses,
  });

  Map<String, dynamic> toMap() {
    return {
      "price": price,
      "title": title,
      "expenses": expenses.map((ExpenseModel e) => e.toMap()).toList(),
    };
  }

  factory GroupModel.fromMap(Map<String, dynamic> map) {
    return GroupModel(
      price: map["price"],
      title: map["title"],
      expenses: List<ExpenseModel>.from(
          map["expenses"]?.map((e) => ExpenseModel.fromMap(e))),
    );
  }
}
