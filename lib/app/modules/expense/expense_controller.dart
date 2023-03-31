import 'package:finance_app/app/models/expense_model.dart';
import 'package:finance_app/app/models/groups_model.dart';
import 'package:finance_app/app/modules/group/group_controller.dart';
import 'package:get/get.dart';

class ExpenseController extends GetxController {
  final _groupController = Get.find<GroupController>();
  final GroupModel group = Get.arguments;
  final expenses = <ExpenseModel>[].obs;

  @override
  void onReady() {
    expenses.value = group.expenses;
    super.onReady();
  }

  void addExpense({required ExpenseModel expense}) {
    expenses.add(expense);
    _groupController.editGroup(group: group);
  }
}
