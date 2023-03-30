import 'package:finance_app/app/models/finance_model.dart';
import 'package:finance_app/app/models/groups_model.dart';
import 'package:finance_app/app/modules/finance/finance_controller.dart';
import 'package:get/get.dart';

class GroupController extends GetxController {
  final FinanceModel finance = Get.arguments;
  final _financeController = Get.find<FinanceController>();
  final _groups = <GroupModel>[].obs;

  get groups => _groups;

  @override
  void onReady() {
    _groups.value = finance.groups;
    super.onReady();
  }

  void addGroup(GroupModel group) {
    _groups.add(group);
    _financeController.editFinance(finance: finance);
  }
}
