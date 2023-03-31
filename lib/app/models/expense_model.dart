import 'package:finance_app/app/core/utils/constants.dart';

class ExpenseModel {
  int id;
  double cost;
  String title;

  ExpenseModel({
    int? id,
    required this.cost,
    required this.title,
  }) : id = id ?? Constants.uid();

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "cost": cost,
      "title": title,
    };
  }

  factory ExpenseModel.fromMap(Map<String, dynamic> map) {
    return ExpenseModel(
      cost: map["cost"] ?? 0.0,
      title: map["title"],
    );
  }
}
