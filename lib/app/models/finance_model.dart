import 'package:finance_app/app/models/groups_model.dart';

class FinanceModel {
  double inflow;
  String title;
  List<GroupModel> groups;

  FinanceModel({
    required this.inflow,
    required this.title,
    required this.groups,
  });

  Map<String, dynamic> toMap() {
    return {
      'inflow': inflow,
      'title': title,
      'groups': groups.map((GroupModel e) => e.toMap()).toList(),
    };
  }

  factory FinanceModel.fromMap(map) {
    return FinanceModel(
        inflow: map['inflow']?.toDouble() ?? 0.0,
        title: map['title'] ?? '',
        groups: List<GroupModel>.from(
            map['groups']?.map((e) => GroupModel.fromMap(e))).toList());
  }

  double totalAmountGroups() {
    if (groups.isEmpty) return 0;
    final prices = groups.map((e) => e.price).toList();
    return prices.reduce((a, b) => a + b);
  }
}
