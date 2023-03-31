import 'package:finance_app/app/models/finance_model.dart';
import 'package:finance_app/app/models/groups_model.dart';
import 'package:finance_app/app/modules/finance/finance_controller.dart';
import 'package:get/get.dart';

class GroupController extends GetxController {
  final FinanceModel finance = Get.arguments;
  final _financeController = Get.find<FinanceController>();
  final groups = <GroupModel>[].obs;

  @override
  void onReady() {
    groups.value = finance.groups;
    super.onReady();
  }

  void addGroup({required GroupModel group}) {
    groups.add(group);
    _saveFinance();
  }

  void editGroup({required GroupModel group}) {
    final index = groups.indexWhere((e) => e.id == group.id);
    groups[index] = group;
    _saveFinance();
  }

  void deleteGroup({required GroupModel group}) {
    groups.removeWhere((e) => e.id == group.id);
    _saveFinance();
  }

  void _saveFinance() {
    _financeController.editFinance(finance: finance);
  }
}
