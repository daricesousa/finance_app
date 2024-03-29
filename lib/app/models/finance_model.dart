import 'package:finance_app/app/models/groups_model.dart';
import 'package:finance_app/app/core/utils/constants.dart';

class FinanceModel {
  int id;
  double inflow;
  DateTime month;
  List<GroupModel> groups;

  FinanceModel({
    int? id,
    required this.inflow,
    required this.month,
    required this.groups,
  }) : id = id ?? Constants.uid();

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'inflow': inflow,
      'month': month.toString(),
      'groups': groups.map((GroupModel e) => e.toMap()).toList(),
    };
  }

  factory FinanceModel.fromMap(map) {
    return FinanceModel(
        id: map['id'] ?? -1,
        inflow: map['inflow']?.toDouble() ?? 0.0,
        month: DateTime.parse(map['month']),
        groups: List<GroupModel>.from(
            map['groups']?.map((e) => GroupModel.fromMap(e))).toList());
  }

  double totalAmountExpenses() {
    var total = 0.0;
    for (var group in groups) {
      for (var expense in group.expenses) {
        total += expense.cost;
      }
    }
    return total;
  }
}
